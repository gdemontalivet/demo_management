view: demo_dashboards {
  sql_table_name: `looker-private-demo.demo_management.demo_dashboards`
    ;;

  dimension: dashboard_name {
    type: string
    sql: ${TABLE}.Dashboard_Name ;;
  }

  dimension: dashboard_slug__from_api_call_ {
    type: string
    sql: ${TABLE}.Dashboard_Slug__from_API_call_ ;;
  }

  dimension: demo_name {
    type: string
    sql: ${TABLE}.Demo_Name ;;
  }

  dimension: demoexpo_id {
    type: string
    sql: ${TABLE}.demoexpo_id ;;
  }

  dimension: development_dashboard_id {
    type: number
    sql: ${TABLE}.Development_Dashboard_ID ;;
  }

  dimension: development_host {
    type: string
    sql: ${TABLE}.Development_Host ;;
  }

  dimension: googledemo {
    type: number
    sql: ${TABLE}.googledemo ;;
  }

  dimension: googledemo_id {
    type: number
    sql: ${TABLE}.googledemo_id ;;
  }

  dimension: partnerdemo {
    type: number
    sql: ${TABLE}.partnerdemo ;;
  }

  dimension: partnerdemo_id {
    type: string
    sql: ${TABLE}.partnerdemo_id ;;
  }

  dimension: sandbox {
    type: number
    sql: ${TABLE}.sandbox ;;
  }

  dimension: trial {
    type: number
    sql: ${TABLE}.trial ;;
  }

  dimension: trial_id {
    type: number
    sql: ${TABLE}.trial_id ;;
  }

  dimension: use_case_name {
    type: string
    sql: ${TABLE}.Use_Case_Name ;;
  }

  measure: count {
    type: count
    drill_fields: [use_case_name, demo_name, dashboard_name]
  }
}
