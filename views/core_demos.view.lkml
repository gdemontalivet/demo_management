view: core_demos {
  sql_table_name: `looker-private-demo.demo_management.core_demos`;;

  dimension: demo_name {
    description: "The name of the demo, this should correspond with a single LookML project"
    type: string
    sql: ${TABLE}.string_field_0 ;;
  }

  dimension: description {
    description: "A short description of the demo"
    type: string
    sql: ${TABLE}.string_field_1 ;;
  }

#   dimension: string_field_2 {
#     #link to demo board, but hyperlink so doesnt come throuh
#     type: string
#     sql: ${TABLE}.string_field_2 ;;
#   }

  dimension: lookml_project_name {
    description: "The name / id of the lookml project for the demo - should be consistent accross all instances"
    type: string
    sql: ${TABLE}.string_field_3 ;;
    link: {
      label: "Go to the development project"
      url: "{{ development_instance._value }}/projects/{{ value }}"
    }
  }

  dimension: slack_feedback  {
    description: "Slack channel for feedback for the demo"
    type: string
    sql: ${TABLE}.string_field_4 ;;
    action: {
      label: "Send a message to slack channel"
      url: "https://placeholder.com"
    }
  }

  dimension: development_instance {
    description: "The instance where you can continue to develop on top of the demo (usually demo.looker.com or demoexpo.loooker.com, depending on the project there may be a PR required"
    type: string
    sql: ${TABLE}.string_field_5 ;;
  }

  dimension: ceo_pitch {
    group_label: "Pitch Decks"
    label: "CEO Pitch Deck"
    description: "Relevant CEO Pitch slide deck"
    type: string
    sql: ${TABLE}.string_field_6 ;;
    html: <a href="{{ value }}">{{ demo_name._value }}</a> ;;
  }

  dimension: cio_pitch {
    group_label: "Pitch Decks"
    label: "CIO Pitch Deck"
    description: "Relevant CIO Pitch slide deck"
    type: string
    sql: ${TABLE}.string_field_7 ;;
    html: <a href="{{ value }}">{{ demo_name._value }}</a> ;;
  }

  dimension: bigquery_project_name {
    view_label: "BigQuery Dataset"
    description: "The project that the dataset for the demo lives in"
    type: string
    sql: ${TABLE}.string_field_8 ;;
    #this could be an automated way to give people temporary edit access for datasets?
    link: {
      label: "Request ability to create a new dataset in this project"
      url: "https://placeholder.com"
    }
    link: {
      label: "View in BQ Console"
      url: "https://console.cloud.google.com/project={{ value }}"
    }
  }

  dimension: bigquery_dataset_name {
    hidden: yes
    #need to convert to an array
    sql: split(${TABLE}.string_field_9,',') ;;
  }

  dimension: guru_demo_flow {
    group_label: "Guru Card Links"
    description: "Link to the guru card with details on using this demo"
    type: string
    sql: ${TABLE}.string_field_10 ;;
    html: <a href="{{ value }}">{{ demo_name._value }} Guru Card</a> ;;
  }

  dimension: guru_datset {
    group_label: "Guru Card Links"
    description: "Link to the guru card with the details on the dataset"
    type: string
    sql: ${TABLE}.string_field_11 ;;
    html: <a href="{{ value }}">{{ demo_name._value }} Dataset Guru Card</a> ;;
  }

  dimension: go_demo_flow {
    group_label: "Go Links"
    description: "Go link to details on using this demo"
    type: string
    sql: ${TABLE}.string_field_12 ;;
    html: <a href="{{ value }}">{{ demo_name._value }} Go Link</a> ;;
  }

  dimension: go_datset {
    group_label: "Go Links"
    description: "Go link details on this dataset"
    type: string
    sql: ${TABLE}.string_field_13 ;;
    html: <a href="{{ value }}">{{ demo_name._value }} Dataset Go Link</a> ;;
  }

  dimension: development_git {
    description: "The development git repository for this project (i.e. the git repository for this project on the development instance - eother demo or demoexpo)"
    group_label: "Git Repositories"
    type: string
    sql: ${TABLE}.string_field_14 ;;
    link: {
      label: "View in Github"
      url: "https://github.com/{{ value }}"
    }
  }

  dimension: googledemo_git {
    description: "The git repository for this project on googledemo"
    group_label: "Git Repositories"
    type: string
    sql: ${TABLE}.string_field_15 ;;
    link: {
      label: "View in Github"
      url: "https://github.com/{{ value }}"
    }
  }

  dimension: partnerdemo_git {
    description: "The git repository for this project on partnerdemo"
    group_label: "Git Repositories"
    type: string
    sql: ${TABLE}.string_field_16 ;;
    link: {
      label: "View in Github"
      url: "https://github.com/{{ value }}"
    }
  }

  dimension: triallooker_git {
    description: "The git repository for this project on trial.looker"
    group_label: "Git Repositories"
    type: string
    sql: ${TABLE}.string_field_17 ;;
    link: {
      label: "View in Github"
      url: "https://github.com/{{ value }}"
    }
  }

#   dimension: string_field_18 {
#     type: string
#     sql: ${TABLE}.string_field_18 ;;
#   }


  measure: count {
    label: "Number of Demos"
    type: count
    drill_fields: [demo_name,lookml_project_name,]
  }
}

view: demo_dataset {
  view_label: "BigQuery Dataset"

  dimension: bigquery_dataset_name {
    hidden: yes
    description: "The dataset (e.g. schema) that the data for this demo lives in"
    type: string
    #need to convert to a string
    sql: trim(${TABLE});;
    #this could be an automated way to give people temporary edit access for datasets?
    link: {
      label: "Request ability to edit data in this project"
      url: "https://placeholder.com"
    }
    link: {
      label: "View in BQ Console"
      url: "https://console.cloud.google.com/project={{ core_demos.bigquery_project_name._value }}&d={{ value }}"
    }
  }
}
