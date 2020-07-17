- dashboard: use_case_lookup
  title: Use Case Lookup
  layout: newspaper
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"border: solid 1px #4285F4; border-radius: 5px; padding:\
      \ 5px 10px; background: #eaf1fe; height: auto; text-align: center; margin-bottom:\
      \ 10px;\">\n\t<div>\n\t\t<img style=\"height: 60px; margin-top: 30px;\" src=\"\
      https://looker.com/assets/img/images/logos/looker_black.svg\"/>\n\t\t<h1 style=\"\
      font-size: 28px;\">Product Demonstrations</h1>\n<p style=\"font-size:15px;margin-left:200px;margin-right:200px;margin-top:30px;margin-bottom:30px\"\
      >Here, you can see the details for a single use case.</p>\n\t</div>\n<nav style=\"\
      font-size: 18px; position: absolute; bottom: 0; text-align: center;\">\n  <a\
      \ style=\"padding: 5px; line-height: 40px;\" href=\"https://demo.looker.com/dashboards-next/5928\"\
      >\n  \t<svg style=\"height: 16px; fill: #4285F4;\" class=\"svg-icon\" viewBox=\"\
      0 0 20 20\">\n\t\t\n\t\t\t\t\t\t\t<path d=\"M17.431,2.156h-3.715c-0.228,0-0.413,0.186-0.413,0.413v6.973h-2.89V6.687c0-0.229-0.186-0.413-0.413-0.413H6.285c-0.228,0-0.413,0.184-0.413,0.413v6.388H2.569c-0.227,0-0.413,0.187-0.413,0.413v3.942c0,0.228,0.186,0.413,0.413,0.413h14.862c0.228,0,0.413-0.186,0.413-0.413V2.569C17.844,2.342,17.658,2.156,17.431,2.156\
      \ M5.872,17.019h-2.89v-3.117h2.89V17.019zM9.587,17.019h-2.89V7.1h2.89V17.019z\
      \ M13.303,17.019h-2.89v-6.651h2.89V17.019z M17.019,17.019h-2.891V2.982h2.891V17.019z\"\
      ></path>\n\t\t\t\t\t\t</svg>\n\t\t\t\t\tUse Cases</a>\n  <a style=\"padding:\
      \ 5px; line-height: 40px;\" href=\"https://demo.looker.com/dashboards-next/5927\"\
      >\n  \t<svg style=\"height: 16px; fill: #4285F4;\" class=\"svg-icon\" viewBox=\"\
      0 0 20 20\">\n\t\t\t\t\t\t\t<path d=\"M12.075,10.812c1.358-0.853,2.242-2.507,2.242-4.037c0-2.181-1.795-4.618-4.198-4.618S5.921,4.594,5.921,6.775c0,1.53,0.884,3.185,2.242,4.037c-3.222,0.865-5.6,3.807-5.6,7.298c0,0.23,0.189,0.42,0.42,0.42h14.273c0.23,0,0.42-0.189,0.42-0.42C17.676,14.619,15.297,11.677,12.075,10.812\
      \ M6.761,6.775c0-2.162,1.773-3.778,3.358-3.778s3.359,1.616,3.359,3.778c0,2.162-1.774,3.778-3.359,3.778S6.761,8.937,6.761,6.775\
      \ M3.415,17.69c0.218-3.51,3.142-6.297,6.704-6.297c3.562,0,6.486,2.787,6.705,6.297H3.415z\"\
      ></path>\n\t\t\t\t\t\t</svg>\n\t\t\t\t\tDatasets</a>\n  <a style=\"padding:\
      \ 5px; line-height: 40px;\" href=\"#contact\">\n  <svg  style=\"height: 16px;\
      \ fill: #4285F4;\" class=\"svg-icon\" viewBox=\"0 0 20 20\">\n\t\t\t\t\t\t\t\
      <path d=\"M17.237,3.056H2.93c-0.694,0-1.263,0.568-1.263,1.263v8.837c0,0.694,0.568,1.263,1.263,1.263h4.629v0.879c-0.015,0.086-0.183,0.306-0.273,0.423c-0.223,0.293-0.455,0.592-0.293,0.92c0.07,0.139,0.226,0.303,0.577,0.303h4.819c0.208,0,0.696,0,0.862-0.379c0.162-0.37-0.124-0.682-0.374-0.955c-0.089-0.097-0.231-0.252-0.268-0.328v-0.862h4.629c0.694,0,1.263-0.568,1.263-1.263V4.319C18.5,3.625,17.932,3.056,17.237,3.056\
      \ M8.053,16.102C8.232,15.862,8.4,15.597,8.4,15.309v-0.89h3.366v0.89c0,0.303,0.211,0.562,0.419,0.793H8.053z\
      \ M17.658,13.156c0,0.228-0.193,0.421-0.421,0.421H2.93c-0.228,0-0.421-0.193-0.421-0.421v-1.263h15.149V13.156z\
      \ M17.658,11.052H2.509V4.319c0-0.228,0.193-0.421,0.421-0.421h14.308c0.228,0,0.421,0.193,0.421,0.421V11.052z\"\
      ></path>\n\t\t\t\t\t\t</svg>\n\t\t\t\t\tHelpful Information</a>\n</nav>\n</div>"
    row: 0
    col: 0
    width: 24
    height: 6
  - title: Where are the Dashboards Available?
    name: Where are the Dashboards Available?
    model: demo_management
    explore: core_demos
    type: looker_grid
    fields: [demo_use_cases.googledemo_board, demo_use_cases.internal_demo_board,
      demo_use_cases.partnerdemo_board, demo_use_cases.trial_board]
    filters: {}
    sorts: [demo_use_cases.googledemo_board]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: above
    note_text: To find more information about each instance head to Helpful Information
    listen:
      Vertical: demo_use_cases.vertical
      Use Case Name: demo_use_cases.use_case_name
    row: 6
    col: 9
    width: 15
    height: 3
  - title: Development Information
    name: Development Information
    model: demo_management
    explore: core_demos
    type: looker_grid
    fields: [core_demos.development_instance, core_demos.development_git, core_demos.lookml_project_name]
    filters: {}
    sorts: [core_demos.development_instance desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: above
    note_text: Are you a Looker & Need to make changes to the LookML? Go here!
    listen:
      Vertical: demo_use_cases.vertical
      Use Case Name: demo_use_cases.use_case_name
    row: 12
    col: 9
    width: 15
    height: 3
  - title: Dashboards
    name: Dashboards
    model: demo_management
    explore: core_demos
    type: looker_grid
    fields: [demo_dashboards.dashboard_name, demo_dashboards.dashboard_slug]
    filters:
      demo_dashboards.dashboard_name: "-NULL"
    sorts: [demo_dashboards.dashboard_name]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: above
    note_text: Click on dashboard name to go view the dashboard in any demo instance
    listen:
      Vertical: demo_use_cases.vertical
      Use Case Name: demo_use_cases.use_case_name
    row: 15
    col: 9
    width: 15
    height: 7
  - title: Enablement Material
    name: Enablement Material
    model: demo_management
    explore: core_demos
    type: looker_grid
    fields: [core_demos.go_demo_flow, demo_use_cases.recorded_demo, demo_use_cases.day_in_the_life,
      demo_use_cases.explore_packet]
    sorts: [core_demos.go_demo_flow]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: To learn more about the different material, head to Helpful Information
    listen:
      Vertical: demo_use_cases.vertical
      Use Case Name: demo_use_cases.use_case_name
    row: 9
    col: 9
    width: 15
    height: 3
  - title: Dataset
    name: Dataset
    model: demo_management
    explore: core_demos
    type: demo_content
    fields: [demo_use_cases.vertical, demo_dataset.bigquery_dataset_name, demo_dataset_metadata.schema_description,
      demo_dataset.link_to_console, demo_dataset_metadata.dataset_detaillink]
    filters:
      demo_dataset.bigquery_dataset_name: "-NULL"
      core_demos.bigquery_project_name: lookerdata,looker-private-demo
    sorts: [demo_use_cases.vertical]
    limit: 1
    query_timezone: America/Los_Angeles
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    color_list: [{color: "#f081ea", value: "\U0001f6cd Retail", show_label: true},
      {color: "#6cf058", value: "\U0001f4bb Technology", show_label: true}, {color: "#f0d72b",
        value: "\U0001f3e6 Financial Services", show_label: true}, {color: "#F0000D",
        value: "\U0001f3e5 Healthcare", show_label: true}, {color: "#847ef0", value: "\U0001f3ae\
          \ Gaming", show_label: true}]
    button_list: [{value: View in Console, icon: Public}, {value: View Details, icon: Notes}]
    tile_type: dataset
    dash: '5971'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    series_types: {}
    listen:
      Use Case Name: demo_use_cases.use_case_name
    row: 14
    col: 0
    width: 9
    height: 8
  - title: Use Case
    name: Use Case
    model: demo_management
    explore: core_demos
    type: demo_content
    fields: [demo_use_cases.vertical, demo_use_cases.use_case_name, demo_use_cases.use_case_description,
      demo_use_cases.trial_board, demo_use_cases.usecase_detail_link]
    sorts: [demo_use_cases.vertical]
    limit: 1
    query_timezone: America/Los_Angeles
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    color_list: [{color: "#f081ea", value: "\U0001f6cd Retail", show_label: true},
      {color: "#6cf058", value: "\U0001f4bb Technology", show_label: true}, {color: "#f0d72b",
        value: "\U0001f3e6 Financial Services", show_label: true}, {color: "#F0000D",
        value: "\U0001f3e5 Healthcare", show_label: true}, {color: "#847ef0", value: "\U0001f3ae\
          \ Gaming", show_label: true}]
    button_list: [{value: Go to Dashboards, icon: Dashboard}, {value: Use Case Details,
        icon: Public}]
    dash: '5971'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    series_types: {}
    listen:
      Use Case Name: demo_use_cases.use_case_name
    row: 6
    col: 0
    width: 9
    height: 8
  filters:
  - name: Use Case Name
    title: Use Case Name
    type: field_filter
    default_value: Hospital Operations
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: inline
    model: demo_management
    explore: core_demos
    listens_to_filters: []
    field: demo_use_cases.use_case_name
  - name: Vertical
    title: Vertical
    type: field_filter
    default_value: "\U0001f3e5 Healthcare"
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: inline
      options:
      - "\U0001f3ae Gaming"
      - "\U0001f3e5 Healthcare"
      - "\U0001f3e6 Financial Services"
      - "\U0001f4bb Technology"
      - "\U0001f6cd Retail"
    model: demo_management
    explore: core_demos
    listens_to_filters: []
    field: demo_use_cases.vertical
