datagroup: dataset_trigger {
  sql_trigger: select count(*) from INFORMATION_SCHEMA.SCHEMATA ;;
}


view: demo_dataset_metadata {
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
          where s.schema_name not like '%staging%';;
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
    sql:format("(SELECT ARRAY_TO_STRING(array_agg(TO_JSON_STRING(struct(table_name, column_name, data_type, is_partitioning_column))),'---') as table_metadata FROM %s.INFORMATION_SCHEMA.COLUMNS)",
      ${schema_name});;
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

  measure: sql_string_aggregated{
    sql: concat("select array_agg(table_metadata) from (",
            array_to_string(array_agg(${sql_string}), ' UNION All '),')');;
  }
}


view: demo_dataset_table_statement {
  derived_table: {
    datagroup_trigger: dataset_trigger
    create_process: {
      sql_step:
            EXECUTE IMMEDIATE (
            select concat("create or replace table demo_management.table_metadata as select array_agg(table_metadata) as json_blob from (",
            array_to_string(array_agg(sql_string), ' UNION All '),')')
            from ${demo_dataset_tables_sql_statements.SQL_TABLE_NAME});;
    }
  }
}




view: demo_dataset_tables {
  derived_table: {
    sql: select split(jsob_blob,'---') from unnest(demo_management.table_metadata.jsob_blob) as json_blob;;
    datagroup_trigger: dataset_trigger
  }

  dimension: json_blob {
    type: string
    hidden: yes
    sql: ${TABLE}.json_blob ;;
  }

  dimension: table_name {
    type: string
    sql: ${json_blob}.table_name ;;

  }
  dimension: column_name{

  }
  dimension: data_type{

  }
  dimension: is_partitioning_column{

  }
}


# view: demo_dataset_tables {
#   derived_table: {
#     sql:
#       DECLARE datasets ARRAY<STRUCT<schema_name STRING>>;
#       DECLARE x INT64 DEFAULT 0;
#       DECLARE length INT64 DEFAULT 0;
#       DECLARE sql_string STRING DEFAULT '';
#       DECLARE sql_string_array array<string> default [""];
#
#       SET datasets = (
#         WITH all_datasets AS (
#          SELECT
#           s.schema_name
#           FROM
#           INFORMATION_SCHEMA.SCHEMATA as s
#           where s.schema_name not like '%staging%'
#         )
#         SELECT ARRAY_AGG(struct(schema_name as schmea_name)) AS datasets
#         FROM all_datasets
#       );
#
#       set length = (
#         select array_length(datasets)
#       );
#
#     LOOP
#       IF x <= length-1 THEN
#         if x=0 then
#           set sql_string_array = [format("(SELECT array_agg(struct(table_name, column_name, data_type, is_partitioning_column)) FROM %s.INFORMATION_SCHEMA.COLUMNS)", datasets[offset(x)].schema_name)];
#         else
#           set sql_string = format("UNION ALL (SELECT array_agg(struct(table_name, column_name, data_type, is_partitioning_column)) FROM %s.INFORMATION_SCHEMA.COLUMNS)", datasets[offset(x)].schema_name);
#           set sql_string_array = array_concat(sql_string_array, [sql_string]);
#         end if;
#         SET x = x + 1;
#       ELSE
#         LEAVE;
#       END IF;
#     END LOOP;
#
#     EXECUTE IMMEDIATE (select
#     ARRAY_TO_STRING(sql_string_array, " "));
#     ;;
#   }
#
#   dimension: table_name {
#     sql: ${TABLE}.table_name ;;
#   }
#
#   dimension: column_name {
#     sql: ${TABLE}.column_name ;;
#   }
#
#   dimension: data_type {
#     sql: ${TABLE}.data_type ;;
#   }
#
#   dimension: is_partitioning_column {
#     sql: ${TABLE}.is_partitioning_column ;;
#   }
#
#
#
# }
