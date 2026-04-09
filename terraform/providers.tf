terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.38.0"
    }
    # To add Snowflake in the future, you would just uncomment and configure below:
    # snowflake = {
    #   source  = "Snowflake-Labs/snowflake"
    #   version = "~> 0.87.0"
    # }
  }
}

provider "databricks" {
  host  = var.databricks_host
  token = var.databricks_token
}
