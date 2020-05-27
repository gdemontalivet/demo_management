access_grant: looker_employee {
  user_attribute: is_looker
  allowed_values: ["yes"]
}

view: demo_use_cases {
  sql_table_name: `looker-private-demo.demo_management.demo_use_cases` ;;

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: concat(${demo_name},${use_case_name}) ;;
  }

  dimension: demo_name {
    hidden: yes
    type: string
    sql: ${TABLE}.string_field_0 ;;
  }

  dimension: vertical {
    type: string
    sql: ${TABLE}.string_field_1 ;;
  }

  dimension: section_id {
    description: "The ID, which corresponds with the order, for the section on the board"
    type: string
    sql: ${TABLE}.string_field_2 ;;
  }

  dimension: use_case_name {
    description: "The name of the use case, corresponds with one section on a board"
    type: string
    sql: ${TABLE}.string_field_3 ;;
  }

  dimension: day_in_the_life {
    group_label: "Links to Other Resources"
    description: "Day in the Life Slides"
    type: string
    sql: ${TABLE}.string_field_4 ;;
    html: <a style="color: blue" href="{{ value }}"><u>[{{ use_case_name._value }} Day in the Life]</u></a>;;
  }

  dimension: explore_packet {
    required_access_grants: [looker_employee]
    group_label: "Links to Other Resources"
    label: "Explore Q & A Packet"
    description: "A link to an Explore Q & A packet that corresponds with this use case, can be used for Business User training"
    type: string
    sql: ${TABLE}.string_field_5 ;;
    html: <a style="color: blue" href="{{ value }}"><u>[{{ use_case_name._value }} Explore Packet]</u></a>;;
  }

  dimension: explore_start {
    group_label: "Links to Other Resources"
    description: "Link to where the explore packet begins"
    type: string
    sql: ${TABLE}.string_field_6 ;;
  }

  dimension: recorded_demo {
    group_label: "Links to Other Resources"
    label: "Recorded Demo"
    type: string
    sql: ${TABLE}.string_field_7 ;;
    html: <a style="color: blue" href="{{ value }}"><u>[{{ use_case_name._value }} Recorded Demo]</u></a>;;
  }

  dimension: customer_story {
    group_label: "Links to Other Resources"
    label: "Customer Story"
    type: string
    sql: ${TABLE}.string_field_8 ;;
    html: <a style="color: blue" href="{{ value }}"><u>[{{ use_case_name._value }} Customer Stories]</u></a>;;
  }

  dimension: internal_demo_board {
    view_label: "Links to Live Demo"
    description: "Link to either demo or demoexpo board"
    sql: coalesce(${demo_board},${demoexpo_board}) ;;
    html: <a style="color: blue" href="{{ value }}"><u>[{{ demo_name._value }} Internal Demo Board]</u></a>;;
  }

  dimension: demo_board {
    hidden: yes
    type: string
    sql: concat('https://demo.looker.com/boards/',${TABLE}.string_field_9) ;;
  }

  dimension: demoexpo_board {
    hidden: yes
    type: string
    sql: concat('https://demo.looker.com/boards/',${TABLE}.string_field_10) ;;
  }

  dimension: trial_board {
    view_label: "Links to Live Demo"
    description: "A link to the board on trial.looker.com"
    type: string
    sql: concat('https://trial.looker.com/boards/',${TABLE}.string_field_11) ;;
    html: <a style="color: blue" href="{{ value }}"><u>[{{ demo_name._value }} Trial.looker Board]</u></a>;;
  }

  dimension: partnerdemo_board {
    description: "A link to the board on partnerdemo"
    view_label: "Links to Live Demo"
    type: string
    sql: concat('https://partnerdemo.corp.looker.com/boards/',${TABLE}.string_field_12) ;;
    html: <a style="color: blue" href="{{ value }}"><u>[{{ demo_name._value }} Partnerdemo Board]</u></a>;;
  }

  dimension: googledemo_board {
    description: "A link to the board on partnerdemo"
    view_label: "Links to Live Demo"
    type: string
    sql: concat('https://googledemo.looker.com/boards/',${TABLE}.string_field_13) ;;
    html: <a style="color: blue" href="{{ value }}"><u>[{{ demo_name._value }} Googledemo Board]</u></a>;;
  }

  measure: count {
    label: "Number of Use Cases"
    type: count
  }
}
