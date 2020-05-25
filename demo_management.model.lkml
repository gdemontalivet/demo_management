connection: "looker-private-demo"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.


explore: core_demos {
  view_label: "Demonstration Information"
  description: "An explore envionrment to find details on available demo content"
  join: demo_dataset {
    relationship: one_to_many
    sql: left join unnest(${core_demos.bigquery_dataset_name}) as demo_dataset;;
  }
  join: demo_use_cases {
    view_label: "Use Case Information"
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

explore: current_demo_projects {
  description: "An explore enviornment to check on ongoing demo projects"
}


explore: demo_dataset_metadata {
  join: demo_dataset_table {
    relationship: one_to_many
    sql_on: ${demo_dataset_metadata.schema_name} = ${demo_dataset_table.schema_name}  ;;
  }
}
