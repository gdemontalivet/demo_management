datagroup: dataset_trigger {
  sql_trigger: select count(*) from INFORMATION_SCHEMA.SCHEMATA ;;
}


view: demo_dataset_metadata {
  view_label: "Schema"
  derived_table: {
    datagroup_trigger: dataset_trigger
    sql:SELECT
          s.catalog_name,
          s.schema_name,
          creation_time,
          option_value as description
          FROM
          INFORMATION_SCHEMA.SCHEMATA as s
          left join (
          select * from
          INFORMATION_SCHEMA.SCHEMATA_OPTIONS
          where option_name = 'description') as so
          on s.schema_name = so.schema_name
          where s.schema_name not like '%staging%' and s.schema_name not like '%scratch%';;
  }

  dimension: primary_key {
    hidden: yes
    sql: concat(${catalog_name},${schema_name}) ;;
  }

  dimension: catalog_name {
    sql: ${TABLE}.catalog_name ;;
  }

  dimension: schema_name {
    sql: ${TABLE}.schema_name ;;
  }

  dimension_group: creation_time {
    type: time
    sql: ${TABLE}.catalog_name ;;
  }

  dimension: description {
    sql: ${TABLE}.description ;;
  }

  dimension: sql_string {
    hidden: no
    sql:format("(SELECT ARRAY_TO_STRING(array_agg(TO_JSON_STRING(struct('%s' as schema_name, table_name, column_name, data_type, is_partitioning_column))),'---') as table_metadata FROM %s.INFORMATION_SCHEMA.COLUMNS)",
      ${schema_name}, ${schema_name});;
  }
}

view: demo_dataset_tables_sql_statements {
  derived_table: {
    datagroup_trigger: dataset_trigger
    explore_source: demo_dataset_metadata {
      column: schema_name {}
      column: sql_string {}
    }
  }

  dimension: schema_name {}
  dimension: sql_string {}
}

view: demo_dataset_table {
  view_label: "Columns"
  derived_table: {
    datagroup_trigger: dataset_trigger
    create_process: {
      sql_step:
            EXECUTE IMMEDIATE (
            select concat("create or replace table demo_management.table_metadata as select array_agg(table_metadata) as json_blob from (",
            array_to_string(array_agg(sql_string), ' UNION All '),')')
            from ${demo_dataset_tables_sql_statements.SQL_TABLE_NAME});;
      sql_step:
            create or replace table ${SQL_TABLE_NAME} as (
            select c as json
              from
            demo_management.table_metadata as m
            left join unnest(json_blob) as j
            left join unnest(split(j,'---')) as c) ;;
      }
    }

    dimension: schema_name {
      hidden: yes
      type: string
      sql: trim(json_extract(${TABLE}.json,'$.schema_name'),'"');;
    }

    dimension: table_name {
      view_label: "Tables"
      type: string
      sql: trim(json_extract(${TABLE}.json,'$.table_name'),'"');;
    }

    dimension: column_name {
      type: string
      sql: trim(json_extract(${TABLE}.json,'$.column_name'),'"');;
    }

    dimension: data_type {
      type: string
      sql: trim(json_extract(${TABLE}.json,'$.data_type'),'"');;
    }

    dimension: is_partitioning_column {
      type: string
      sql: trim(json_extract(${TABLE}.json,'$.is_partitioning_column'),'"');;
    }
}
