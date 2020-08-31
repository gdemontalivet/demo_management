project_name: "trial_instance_management"

# application: homepage_extenstion {
#   label: "Homepage"
#   url: "http://localhost:8080/bundle.js"
# }


application: homepage_extenstion {
  label: "Homepage"
  file: "bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    allow_forms: yes
    allow_same_origin: yes
    core_api_methods: ["run_look","all_homepages","all_lookml_models","homepage"]

  }
}
