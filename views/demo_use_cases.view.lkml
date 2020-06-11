

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
    sql: ${TABLE}.Demo_Name ;;
  }

  dimension: vertical {
    type: string
    sql: ${TABLE}.Vertical_ ;;
  }

  dimension: section_id {
    description: "The ID, which corresponds with the order, for the section on the board"
    type: string
    sql: ${TABLE}.Use_Case_Section_ID ;;
  }

  dimension: use_case_name {
    description: "The name of the use case, corresponds with one section on a board"
    type: string
    sql: ${TABLE}.Use_Case_Name ;;
  }

  dimension: day_in_the_life {
    required_access_grants: [looker_employee]
    group_label: "Links to Other Resources"
    description: "Day in the Life Slides"
    type: string
    sql: ${TABLE}.DITL_Link_ ;;
     html: <div style="background: #eaf1fe; border-radius: 2px; border: solid 1px #4285F4; color: #000000; display: inline-block; font-size: 12px; font-weight: bold; line-height: 1; padding: 3px 4px; width: 100%; text-align: center;"><a href="{{ value }}" target="_blank">
    {{ use_case_name._value }} Day in the Life </a></div>;;
  }

  dimension: explore_packet {
    group_label: "Links to Other Resources"
    label: "Explore Q & A Packet"
    description: "A link to an Explore Q & A packet that corresponds with this use case, can be used for Business User training"
    type: string
    sql: ${TABLE}.Explore_Q_A ;;
     html: <div style="background: #eaf1fe; border-radius: 2px; border: solid 1px #4285F4; color: #000000; display: inline-block; font-size: 12px; font-weight: bold; line-height: 1; padding: 3px 4px; width: 100%; text-align: center;"><a href="{{ value }}" target="_blank">
    {{ use_case_name._value }} Explore Packet </a></div>;;
  }

  dimension: explore_packet_embed_url {
    hidden: yes
    group_label: "Links to Other Resources"
    label: "Explore Packet Embed URL"
    type: string
    sql: case when ${TABLE}.Explore_Q_A  is not null then 'https://docs.google.com/document/d/e/2PACX-1vRQ45rPpvA4Oudid68SzISQ7tjTvMDg6HsaVcKQSCVPdmjcSNdXsgKF68FEdp8EpnuxLg7MgwemMX2t/pub?embedded=true'
    else null end;;
  }

  dimension: explore_start {
    hidden: yes
    group_label: "Links to Other Resources"
    description: "Link to where the explore packet begins"
    type: string
    sql: ${TABLE}.Explore_Start ;;
  }

  dimension: recorded_demo {
    group_label: "Links to Other Resources"
    label: "Recorded Demo"
    type: string
    sql: ${TABLE}.Recorded_Demo ;;
    html: <div style="background: #eaf1fe; border-radius: 2px; border: solid 1px #4285F4; color: #000000; display: inline-block; font-size: 12px; font-weight: bold; line-height: 1; padding: 3px 4px; width: 100%; text-align: center;"><a href="{{ value }}" target="_blank">
    {{ use_case_name._value }} Recorded Demo </a></div>;;
  }

  dimension: embed_demo_url {
    hidden: yes
    group_label: "Links to Other Resources"
    label: "Recorded Demo Embed URL"
    type: string
    sql: REPLACE(${TABLE}.Recorded_Demo,'watch?v=', '/embed/') ;;
  }

  dimension: customer_story {
    group_label: "Links to Other Resources"
    label: "Customer Story"
    type: string
    sql: ${TABLE}.Customer_Story ;;
    html: <div style="background: #eaf1fe; border-radius: 2px; border: solid 1px #4285F4; color: #000000; display: inline-block; font-size: 12px; font-weight: bold; line-height: 1; padding: 3px 4px; width: 100%; text-align: center;"><a href="{{ value }}" target="_blank">
    {{ use_case_name._value }} Customer Stories </a></div>;;
  }

  dimension: internal_demo_board {
    view_label: "Links to Live Demo"
    description: "Link to either demo or demoexpo board"
    sql: coalesce(${demo_board},${demoexpo_board}) ;;
     html: <div style="background: #eaf1fe; border-radius: 2px; border: solid 1px #4285F4; color: #000000; display: inline-block; font-size: 12px; font-weight: bold; line-height: 1; padding: 3px 4px; width: 100%; text-align: center;"><a href="{{ value }}" target="_blank">
    Go to {{ demo_name._value }} Internal Demo Board </a></div>;;
  }


  dimension: demo_board {
    hidden: yes
    type: string
    sql: concat('https://demo.looker.com/browse/boards/',${TABLE}.demo) ;;
  }

  dimension: demoexpo_board {
    hidden: yes
    type: string
    sql: concat('https://demo.looker.com/browse/boards/',${TABLE}.demoexpo) ;;
  }

  dimension: trial_board_id {
    hidden: yes
    group_label: "Board IDs"
    view_label: "Links to Live Demo"
    type: string
    sql: ${TABLE}.trial ;;
  }

  dimension: googledemo_board_id {
    hidden: yes
    group_label: "Board IDs"
    view_label: "Links to Live Demo"
    type: string
    sql: ${TABLE}.googledemo ;;
  }

  dimension: partnerdemo_board_id {
    hidden: yes
    group_label: "Board IDs"
    view_label: "Links to Live Demo"
    type: string
    sql: ${TABLE}.parterndemo ;;
  }

  dimension: trial_board {
    view_label: "Links to Live Demo"
    description: "A link to the board on trial.looker.com"
    type: string
    sql: concat('https://trial.looker.com/browse/boards/',${trial_board_id}) ;;
    #html: <a style="color: blue" href="{{ value }}"><u>[{{ demo_name._value }} Trial.looker Board]</u></a>;;
    html: <div style="background: #eaf1fe; border-radius: 2px; border: solid 1px #4285F4; color: #000000; display: inline-block; font-size: 12px; font-weight: bold; line-height: 1; padding: 3px 4px; width: 100%; text-align: center;"><a href="{{ value }}" target="_blank">
        Go to {{ demo_name._value }} Trial.looker Board </a></div>;;
  }

  dimension: partnerdemo_board {
    description: "A link to the board on partnerdemo"
    view_label: "Links to Live Demo"
    type: string
    sql: concat('https://partnerdemo.corp.looker.com/browse/boards/',${TABLE}.partnerdemo) ;;
    html: <div style="background: #eaf1fe; border-radius: 2px; border: solid 1px #4285F4; color: #000000; display: inline-block; font-size: 12px; font-weight: bold; line-height: 1; padding: 3px 4px; width: 100%; text-align: center;"><a href="{{ value }}" target="_blank">
    Go to {{ demo_name._value }} Partnerdemo Board </a></div>;;
  }

  dimension: googledemo_board {
    description: "A link to the board on partnerdemo"
    view_label: "Links to Live Demo"
    type: string
    sql: concat('https://googledemo.looker.com/browse/boards/',${TABLE}.googledemo) ;;
#     html: <a style="color: blue" href="{{ value }}"><u>[{{ demo_name._value }} Googledemo Board]</u></a>;;
     html: <div style="background: #eaf1fe; border-radius: 2px; border: solid 1px #4285F4; color: #000000; display: inline-block; font-size: 12px; font-weight: bold; line-height: 1; padding: 3px 4px; width: 100%; text-align: center;"><a href="{{ value }}" target="_blank">
    Go to {{ demo_name._value }} Googledemo Board </a></div>;;

  }

  dimension: pendo_guide {
    hidden: yes
    type: string
    sql: ${TABLE}.Guide_Link ;;
  }

  dimension: use_case_description {
    type: string
    sql: ${TABLE}.Use_Case_Description ;;
  }

  dimension: has_ditl {
    hidden: yes
    type: yesno
    sql: ${day_in_the_life} is not null;;
  }

  dimension: has_explore_packet {
    hidden: yes
    type: yesno
    sql: ${explore_packet} is not null;;
  }

  dimension: has_recorded_demo {
    hidden: yes
    type: yesno
    sql: ${recorded_demo} is not null ;;
  }

  dimension: usecase_detail_link {
    type: string
    sql: concat('/dashboards-next/5968?Use+Case+Name=',${use_case_name},'&Vertical=',${vertical});;
  }

  dimension: ditl_status {
    type: string
    sql: case when ${has_ditl} = 'yes' then 'Complete'
          when ${TABLE}.DITL_Status is null then 'No one signed up'
          else ${TABLE}.DITL_Status end
           ;;
  }

  dimension: explore_packet_status {
    type: string
    sql: case when ${has_explore_packet} = 'yes' then 'Complete'
          when ${TABLE}.Explore_Status is null then 'No one signed up'
          else ${TABLE}.Explore_Status end
           ;;
  }

  dimension: recorded_demo_status {
    type: string
    sql: case when ${has_recorded_demo} = 'yes' then 'Complete'
          when ${TABLE}.Recorded_Demo_Status is null then 'No one signed up'
          else ${TABLE}.Recorded_Demo_Status end
           ;;
  }

  measure: count_ditl {
    label: "Number of DITL Use Cases"
    type: count
    filters: [has_ditl: "yes"]
    drill_fields: [vertical, use_case_name, day_in_the_life]
  }

  measure: count_explore_qa {
    label: "Number of Explore Q&A Packets"
    type: count
    filters: [has_explore_packet: "yes"]
    drill_fields: [vertical, use_case_name, explore_packet]
  }

  measure: count {
    label: "Number of Use Cases"
    type: count
  }
}
