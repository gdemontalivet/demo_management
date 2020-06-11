view: core_demos {
  sql_table_name: `looker-private-demo.demo_management.core_demos`;;

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: concat(${development_instance},${lookml_project_name}) ;;
  }

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
    html: <a style="color: blue" href="{{ value }}"><u>[{{ demo_name._value }} CIO Pitch]</u></a> ;;
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
    description: "Link to the guru card with details on using this demo"
    type: string
    sql: ${TABLE}.string_field_10 ;;
    html: <a style="color: blue" href="{{ value }}"><u>[{{ demo_name._value }} Guru Card]</u></a> ;;
  }

  dimension: guru_datset {
    view_label: "BigQuery Dataset"
    description: "Link to the guru card with the details on the dataset"
    type: string
    sql: ${TABLE}.string_field_11 ;;
    html: <a style="color: blue" href="{{ value }}"><u>[{{ demo_name._value }} Dataset Guru Card]</u></a> ;;
  }

  dimension: go_demo_flow {
    description: "Go link to details on using this demo"
    type: string
    sql: ${TABLE}.string_field_12 ;;
    html: <a style="color: blue" href="{{ value }}"><u>[{{ demo_name._value }} Go Link]</u></a> ;;
  }

  dimension: go_dataset {
    view_label: "BigQuery Dataset"
    description: "Go link details on how this dataset was created"
    type: string
    sql: ${TABLE}.string_field_13 ;;
    html: <div style="background: #eaf1fe; border-radius: 2px; border: solid 1px #4285F4; color: #000000; display: inline-block; font-size: 12px; font-weight: bold; line-height: 1; padding: 3px 4px; width: 100%; text-align: center;"><a href="{{ value }}" target="_blank">
    Go to {{ demo_name._value }} Dataset Generation Info </a></div>;;
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

  dimension: has_pitch_deck {
    hidden: yes
    type: yesno
    sql: ${cio_pitch} is not null OR ${ceo_pitch} is not null;;
  }


  measure: count {
    label: "Number of Demos"
    type: count
    drill_fields: [demo_name,lookml_project_name,]
  }

  measure: count_pitch_decks {
    label: "Number of Pitch Decks"
    type: count
    filters: [has_pitch_deck: "yes"]
    drill_fields: [demo_name,ceo_pitch,cio_pitch]
  }

}

view: demo_dataset {
  view_label: "BigQuery Dataset"

  dimension: availability {
    type: string
    description: "Is this dataset available to be queried by anyone?"
    sql: case when ${core_demos.bigquery_project_name} = 'looker-private-demo' then 'Publicly availabile for anyone with BQ'
            else 'Restricted to internal use' end;;
  }

  dimension: link_to_console {
    type: string
    sql: concat("https://console.cloud.google.com/bigquery?project=",${core_demos.bigquery_project_name},
              "&p=",${core_demos.bigquery_project_name},'&d=',${bigquery_dataset_name},'&page=dataset') ;;
  }

  dimension: bigquery_dataset_name {
    description: "The dataset (e.g. schema) that the data for this demo lives in"
    type: string
    sql: trim(${TABLE});;
    #this could be an automated way to give people temporary edit access for datasets?
    link: {
      label: "Request ability to edit data in this project"
      url: "https://placeholder.com"
    }
    link: {
      label: "View in BQ Console"
      url: "{{ link_to_console._value }}"
    }
  }
}
