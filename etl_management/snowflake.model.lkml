connection: "snowflake"

include: "*.view.lkml"                # include all views in the views/ folder in this project


explore: snowflake_events {}

explore: atom_snowflake_events {}
