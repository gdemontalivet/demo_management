connection: "looker-private-demo"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
include: "/dashboards/*.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

persist_for: "24 hours"

access_grant: looker_employee {
  allowed_values: ["yes"]
  user_attribute: is_looker
}

explore: core_demos {
  fields: [ALL_FIELDS*, -demo_dataset_metadata.schema_name]
  hidden: yes
  view_label: "Demonstration Information"
  description: "An explore envionrment to find details on available demo content"
  join: demo_dataset {
    relationship: one_to_many
    sql: left join unnest(${core_demos.bigquery_dataset_name}) as demo_dataset;;
  }
  join: demo_dataset_metadata {
    view_label: "BigQuery Dataset"
    relationship: many_to_one
    sql_on: ${demo_dataset_metadata.schema_name} =  ${demo_dataset.bigquery_dataset_name};;
  }
  join: demo_dataset_table_sizes {
    view_label: "BigQuery Tables"
    relationship: one_to_many
    sql_on: ${demo_dataset_metadata.schema_name} = ${demo_dataset_table_sizes.schema_name};;
  }
  join: demo_dataset_columns {
    view_label: "BigQuery Columns"
    relationship: one_to_many
    sql_on: ${demo_dataset_table_sizes.schema_name} = ${demo_dataset_columns.schema_name}
      and ${demo_dataset_table_sizes.table_name} = ${demo_dataset_columns.table_name};;
  }
  join: demo_dataset_tables {
    view_label: "BigQuery Tables"
    relationship: many_to_one
    sql_on: ${demo_dataset_tables.schema_name} = ${demo_dataset_table_sizes.schema_name}
      and ${demo_dataset_tables.table_name} = ${demo_dataset_table_sizes.table_name};;
  }
  join: schema_facts {
    view_label: "BigQuery Dataset"
    relationship: one_to_one
    sql_on: ${schema_facts.bigquery_dataset_name} = ${demo_dataset_metadata.schema_name} ;;
  }
  join: table_facts {
    view_label: "BigQuery Tables"
    relationship: one_to_one
    sql_on: ${table_facts.full_table_name} = ${demo_dataset_table_sizes.full_table_name} ;;
  }
  join: demo_use_cases {
    view_label: "Use Case Information"
    type: full_outer
    relationship: one_to_many
    sql_on: ${demo_use_cases.demo_name} = ${core_demos.demo_name} ;;
  }
  join: demo_dashboards {
    view_label: "Dashboard Details"
    relationship: one_to_many
    sql_on: ${demo_use_cases.demo_name} = ${demo_dashboards.demo_name} and
    ${demo_use_cases.use_case_name} = ${demo_dashboards.use_case_name} ;;
  }
}


explore: demo_dataset_metadata {
  fields: [ALL_FIELDS*, -demo_dataset_metadata.dataset_detaillink]
  hidden: yes
  join: demo_dataset_table_sizes {
    relationship: one_to_many
    sql_on: ${demo_dataset_metadata.schema_name} = ${demo_dataset_table_sizes.schema_name};;
  }
  join: demo_dataset_columns {
    relationship: one_to_many
    sql_on: ${demo_dataset_table_sizes.schema_name} = ${demo_dataset_columns.schema_name}
    and ${demo_dataset_table_sizes.table_name} = ${demo_dataset_columns.table_name};;
  }
  join: demo_dataset_tables {
    relationship: many_to_one
    sql_on: ${demo_dataset_tables.schema_name} = ${demo_dataset_table_sizes.schema_name}
    and ${demo_dataset_tables.table_name} = ${demo_dataset_table_sizes.table_name};;
  }
}
