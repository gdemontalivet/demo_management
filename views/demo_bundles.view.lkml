view: demo_bundles {
  sql_table_name: `looker-private-demo.demo_management.demo_bundles`
    ;;

  dimension: available_in_googledemo_ {
    group_label: "Where is it available?"
    label: "In Googledemo"
    description: "Is this demo available in googledemo.looker.com (an instance available for Google CEs to demo off of)?"
    type: yesno
    sql: ${TABLE}.Available_in_googledemo_ ;;
  }

  dimension: available_in_partnerdemo_ {
    group_label: "Where is it available?"
    label: "In Partnerdemo"
    description: "Is this demo available in partnerdemo.looker.com (an instance available for GIS Partners to demo off of)?"
    type: yesno
    sql: ${TABLE}.Available_in_partnerdemo_ ;;
  }

  dimension: available_in_trial_looker_ {
    group_label: "Where is it available?"
    label: "In Trial.looker"
    description: "Is this demo available in trial.looker.com (an instance available for prospects to use)?"
    type: yesno
    sql: ${TABLE}.Available_in_trial_looker_ ;;
  }

  dimension: board_link_ {
    label: "Link to Demo"
    description: "The link to the board with the demo.looker.com, either demoexpo or demo.looker.com"
    type: string
    sql: ${TABLE}.Board_Link_ ;;
  }

  dimension: dataset_guru_card {
    group_label: "Guru Links"
    label: "Link to Dataset Details"
    description: "The link to the board with the demo.looker.com, either demoexpo or demo.looker.com"
    type: string
    sql: ${TABLE}.Dataset_Guru_Card ;;
  }

  dimension: demo_guru_card {
    group_label: "Guru Links"
    label: "Link to Dataset Details"
    description: "The link to the board with the demo.looker.com, either demoexpo or demo.looker.com"
    type: string
    sql: ${TABLE}.Demo_Guru_Card ;;
  }

  dimension: ditl_link_ {
    hidden: yes
    group_label: "Links"
    label: "Link to Day in the Life Slides"
    description: "The link to the board with the demo.looker.com, either demoexpo or demo.looker.com"
    type: string
    sql: ${TABLE}.DITL_Link_ ;;
  }

  dimension: ditl_status {
    hidden: yes
    label: "Day in the Life Status"
    group_label: "Status of Demo Content"
    type: string
    sql: ${TABLE}.DITL_Status ;;
  }

  dimension: doc_link {
    label: "Day in the Life Status"
    group_label: "Status of Demo Content"
    type: string
    sql: ${TABLE}.Doc_Link ;;
  }

  dimension: on_go_page_ {
    hidden: yes
    type: string
    sql: ${TABLE}.On_Go_page_ ;;
  }

  dimension: on_se_portal_ {
    hidden: yes
    type: yesno
    sql: ${TABLE}.On_SE_portal_ ;;
  }

  dimension: slides_ceo_pitch {
    group_label: "Slide Decks"
    label: "CEO Pitch Link"
    description: "Pitch decks focused on high level business overview"
    type: string
    sql: ${TABLE}.Slides_CEO_Pitch ;;
  }

  dimension: slides_cio_pitch {
    group_label: "Slide Decks"
    label: "CIO Pitch Link"
    description: "Pitch decks focused on more technical benefits"
    type: string
    sql: ${TABLE}.Slides_CIO_Pitch ;;
  }

  dimension: slides_status {
    hidden: yes
    type: string
    sql: ${TABLE}.Slides_Status ;;
  }

  dimension: use_case_name {
    label: " Demo Name"
    description: "The name of the demo, based off of the use case"
    type: string
    sql: ${TABLE}.Use_Case_Name ;;
    link: {
      label: "Go to internal demo board"
      icon_url: "https://looker.com/favicon.ico"
      url: "{{ board_link_._value }}"
    }
    link: {
      label: "Review demo flow"
      icon_url: "https://slack-files2.s3-us-west-2.amazonaws.com/avatars/2017-05-23/186418792368_863551f93920c25834de_512.png"
      url: "{{ demo_guru_card._value }}"
    }
    link: {
      label: "Find details on dataset"
      icon_url: "https://slack-files2.s3-us-west-2.amazonaws.com/avatars/2017-05-23/186418792368_863551f93920c25834de_512.png"
      url: "{{ dataset_guru_card._value }}"
    }
  }

  dimension: use_case_section_id {
    hidden: yes
    type: number
    sql: ${TABLE}.Use_Case_Section_ID ;;
  }

  dimension: vertical_ {
    label: " Vertical"
    description: "The vertical of the demo is in"
    type: string
    sql: ${TABLE}.Vertical_ ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [use_case_name]
  }
}
