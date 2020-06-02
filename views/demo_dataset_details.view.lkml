datagroup: dataset_trigger {
  sql_trigger: select count(*) from INFORMATION_SCHEMA.SCHEMATA ;;
}


view: demo_dataset_metadata {
  view_label: " Schema"
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
          where s.schema_name not like '%staging%' and s.schema_name not like '%scratch%'
          and s.schema_name not like '%google_analytics%';;
  }

  dimension: primary_key {
    hidden: yes
    sql: concat(${catalog_name},${schema_name}) ;;
  }

  dimension: catalog_name {
    hidden: yes
    sql: ${TABLE}.catalog_name ;;
  }

  dimension: schema_name {
    sql: ${TABLE}.schema_name ;;
  }

  dimension_group: creation_time {
    type: time
    sql: ${TABLE}.creation_time ;;
  }

  dimension: schema_description {
    sql: trim(${TABLE}.description,'"') ;;
  }

  dimension: column_sql_string {
    hidden: yes
    sql:format("(SELECT ARRAY_TO_STRING(array_agg(TO_JSON_STRING(struct('%s' as schema_name, table_name, column_name, data_type, is_partitioning_column))),'---') as column_metadata FROM %s.INFORMATION_SCHEMA.COLUMNS)",
      ${schema_name}, ${schema_name});;
  }

  dimension: table_sql_string {
    hidden: no
    sql:format("(SELECT ARRAY_TO_STRING(array_agg(TO_JSON_STRING(struct('%s' as schema_name, table_name, option_value as description))),'---') as table_metadata FROM %s.INFORMATION_SCHEMA.TABLE_OPTIONS where option_name = 'description')",
      ${schema_name}, ${schema_name});;
  }

  dimension: table_size_sql_string {
    hidden: yes
    sql:format("(SELECT ARRAY_TO_STRING(array_agg(TO_JSON_STRING(struct('%s' as schema_name, table_id as table_name, DATE_FROM_UNIX_DATE(SAFE_CAST(CEIL(last_modified_time/60/60/24/1000) AS INT64)) as modified_date, row_count, TRUNC(size_bytes/1073741824,2) as size_gb))),'---') as table_size_metadata FROM %s.__TABLES__)",
      ${schema_name}, ${schema_name});;
  }
}

view: demo_dataset_sql_statements {
  derived_table: {
    datagroup_trigger: dataset_trigger
    explore_source: demo_dataset_metadata {
      column: schema_name {}
      column: column_sql_string {}
      column: table_sql_string {}
      column: table_size_sql_string {}
    }
  }

  dimension: schema_name {
    primary_key: yes
  }
  dimension: column_sql_string {}
  dimension: table_sql_string {}
  dimension: table_size_sql_string {}
}

view: demo_dataset_columns {
  view_label: "Column"
  derived_table: {
    datagroup_trigger: dataset_trigger
    create_process: {
      sql_step:
            EXECUTE IMMEDIATE (
            select concat("create or replace table demo_management.column_metadata as select array_agg(column_metadata IGNORE NULLS) as json_blob from (",
            array_to_string(array_agg(column_sql_string), ' UNION All '),')')
            from ${demo_dataset_sql_statements.SQL_TABLE_NAME});;
      sql_step:
            create or replace table ${SQL_TABLE_NAME} as (
            select c as json
              from
           demo_management.column_metadata as m
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
      view_label: " Table"
      type: string
      sql: trim(json_extract(${TABLE}.json,'$.table_name'),'"');;
    }

    dimension: column_name {
      type: string
      sql: trim(json_extract(${TABLE}.json,'$.column_name'),'"');;
    }

    dimension: full_column_name {
      primary_key: yes
      description: "Full path to the column"
      type: string
      sql: concat(${demo_dataset_table_sizes.full_table_name},'.',${column_name});;
    }

    dimension: data_type {
      type: string
      sql: trim(json_extract(${TABLE}.json,'$.data_type'),'"');;
    }

    dimension: is_partitioning_column {
      type: yesno
      sql: trim(json_extract(${TABLE}.json,'$.is_partitioning_column'),'"') = "YES";;
    }

    dimension: is_nested_field {
      type: yesno
      sql: ${data_type} like '%ARRAY%' ;;
    }

    measure: number_of_fields {
      type: count
    }

    measure: number_of_nested_fields {
      type: count
      filters: [is_nested_field: "yes"]
    }

    measure: number_of_partitioned_columns {
      type: count
      filters: [is_partitioning_column: "yes"]
    }
}

view: demo_dataset_tables {
  view_label: " Table"
  derived_table: {
    datagroup_trigger: dataset_trigger
    create_process: {
      sql_step:
            EXECUTE IMMEDIATE (
            select concat("create or replace table demo_management.table_metadata as select array_agg(table_metadata IGNORE NULLS) as json_blob from (",
            array_to_string(array_agg(table_sql_string), ' UNION All '),')')
            from ${demo_dataset_sql_statements.SQL_TABLE_NAME});;
      sql_step:
            create or replace table ${SQL_TABLE_NAME} as (
            select c as json
              from
            demo_management.table_metadata as m
            left join unnest(json_blob) as j
            left join unnest(split(j,'---')) as c) ;;
    }
  }

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: concat(${schema_name},${table_name}) ;;
  }

  dimension: schema_name {
    hidden: yes
    type: string
    sql: trim(json_extract(${TABLE}.json,'$.schema_name'),'"');;
  }

  dimension: table_name {
    hidden: yes
    type: string
    sql: trim(json_extract(${TABLE}.json,'$.table_name'),'"');;
  }

  dimension: table_description {
    type: string
    sql: trim(json_extract(${TABLE}.json,'$.description'),'"');;
  }
}

view: demo_dataset_table_sizes {
  view_label: " Table"
  derived_table: {
    datagroup_trigger: dataset_trigger
    create_process: {
      sql_step:
            EXECUTE IMMEDIATE (
            select concat("create or replace table demo_management.table_size_metadata as select array_agg(table_size_metadata IGNORE NULLS) as json_blob from (",
            array_to_string(array_agg(table_size_sql_string), ' UNION All '),')')
            from ${demo_dataset_sql_statements.SQL_TABLE_NAME});;
      sql_step:
            create or replace table ${SQL_TABLE_NAME} as (
            select c as json
              from
            demo_management.table_size_metadata as m
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
    hidden: yes
    type: string
    sql: trim(json_extract(${TABLE}.json,'$.table_name'),'"');;
  }

  dimension_group: last_modified {
    type: time
    sql: timestamp(trim(json_extract(${TABLE}.json,'$.modified_date'),'"'));;
  }

  dimension: row_count {
    type: number
    sql: cast(trim(json_extract(${TABLE}.json,'$.row_count'),'"') as int64);;
  }

  dimension: row_count_millions {
    type: number
    sql: trunc(${row_count}/1000000,3) ;;
  }

  dimension: size_gb {
    type: number
    sql: cast(trim(json_extract(${TABLE}.json,'$.size_gb'),'"') as float64);;
  }

  dimension: full_table_name {
    primary_key: yes
    description: "Full path to the table"
    type: string
    sql: concat('`',${demo_dataset_metadata.catalog_name},'.',${schema_name},'.',${table_name},'`');;
  }

}
