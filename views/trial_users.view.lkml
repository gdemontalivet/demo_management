view: trial_users {
  required_access_grants: [looker_employee]
  sql_table_name: `looker-private-demo.demo_management.trial_users`;;

  dimension: account_email {
    type: string
    sql: ${TABLE}.account_email ;;
  }

  dimension: explorer_or_developer {
    type: string
    sql: ${TABLE}.explorer_or_developer ;;
  }

  dimension: new_or_extend {
    type: string
    sql: ${TABLE}.new_or_extend ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension: prospect_or_looker {
    type: string
    sql: ${TABLE}.prospect_or_looker ;;
  }

  dimension: se_email {
    type: string
    sql: ${TABLE}.se_email ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: verticals {
    type: string
    sql: ${TABLE}.verticals ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
