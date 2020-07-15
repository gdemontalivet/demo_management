view: demo_dashboards {
  sql_table_name: `looker-private-demo.demo_management.demo_dashboards`;;

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: concat(${development_host},${development_dashboard_id}, '::',regexp_replace(lower(${use_case_name}), '[^a-zA-Z0-9]', '_')) ;;
  }

  dimension: dashboard_name {
    type: string
    sql: ${TABLE}.Dashboard_Name ;;
    link: {
      label: "{% if googledemo._value > 0 %} View dashboard on development instance (i.e. Demo, Demoexpo, GoogleCloud) {% endif %}"
      url: "{{ development_host._value }}/dashboards/{{ dashboard_slug._value }}"
    }
    link: {
      label: "View dashboard on trial.looker"
      url: "https://trial.looker.com/dashboards/{{ dashboard_slug._value }}"
    }
    link: {
      label: "View dashboard on googledemo"
      url: "https://googledemo.looker.com/{{ dashboard_slug._value }}"
    }
    link: {
      label: "View dashboard on partnerdemo"
      url: "https://partnerdemo.corp.looker.com/{{ dashboard_slug._value }}"
    }
  }

  dimension: dashboard_slug {
    description: "The dashboard slug is unique across instances"
    type: string
    sql: ${TABLE}.Dashboard_Slug__from_API_call_ ;;
  }

  ### Foriegn keys ###

  dimension: demo_name {
    hidden: yes
    type: string
    sql: ${TABLE}.Demo_Name ;;
  }

  dimension: use_case_name {
    hidden: yes
    type: string
    sql: ${TABLE}.Use_Case_Name ;;
  }

  dimension: development_dashboard_id {
    hidden: no
    description: "The dashoard ID on the development instance"
    type: number
    sql: ${TABLE}.Development_Dashboard_ID ;;
  }

  dimension: development_host {
    hidden: yes
    type: string
    sql: ${TABLE}.Development_Host ;;
  }

  ### Destination Folder IDs

  dimension: googledemo {
    label: "Googledemo Folder"
    group_label: "Destination Folder IDs (for gzr)"
    type: number
    sql: ${TABLE}.googledemo ;;
    link: {
      label: "View Folder"
      url: "https://googledemo.looker.com/folders/{{ value }}"
    }
  }

  dimension: partnerdemo {
    label: "Partnerdemo Folder"
    group_label: "Destination Folder IDs (for gzr)"
    type: number
    sql: ${TABLE}.partnerdemo ;;
    link: {
      label: "View Folder"
      url: "https://partnerdemo.corp.looker.com/folders/{{ value }}"
    }
  }

  dimension: sandbox {
    hidden: yes
    label: "Sandbox Folder"
    group_label: "Destination Folder IDs (for gzr)"
    type: number
    sql: ${TABLE}.sandbox ;;
  }

  dimension: trial {
    label: "Trial.looker Folder"
    group_label: "Destination Folder IDs (for gzr)"
    type: number
    sql: ${TABLE}.trial ;;
    link: {
      label: "View Folder"
      url: "https://trial.looker.com/folders/{{ value }}"
    }
  }

  dimension: model {
    label: "LookML Model"
    type: string
    sql: ${TABLE}.model ;;
    description: "LookML model used for getting the LookML dashboard ID"
  }

  dimension: lookml_dashboard_id {
    label: "LookML Dashboard ID"
    description: "model::title - used for importing the dashboard into other instances"
    type: string
    sql: concat(${model},'::',regexp_replace(lower(${dashboard_name}), '[^a-zA-Z0-9]', '_')) ;;
  }


  measure: count {
    label: "Number of Dashboards"
    type: count
    drill_fields: [use_case_name, demo_name, dashboard_name]
  }
}
