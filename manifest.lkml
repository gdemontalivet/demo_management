project_name: "trial_instance_management"

application: homepage_extenstion {
  label: "Homepage"
  #url: "http://localhost:8080/bundle.js"
  file: "bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    core_api_methods: ["run_look","all_homepages","all_lookml_models","homepage","versions"]
  }
}
