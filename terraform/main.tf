# Look up the latest Databricks runtime version dynamically
data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}

# -------------------------------------------------------------------------------------------------
# EXAMPLE: Provisioning a Databricks SQL Warehouse specifically for dbt
#
# NOTE: Databricks SQL Warehouses are generally the best compute option to run dbt models since
# they are optimized for SQL and highly scalable.
# -------------------------------------------------------------------------------------------------
resource "databricks_sql_endpoint" "dbt_warehouse" {
  name             = "dbt_warehouse_${var.environment}"
  cluster_size     = "2X-Small"
  min_num_clusters = 1
  max_num_clusters = 1
  auto_stop_mins   = 10 # Automatically shut down after 10m to save cost

  tags {
    custom_tags {
      key   = "Environment"
      value = var.environment
    }
  }
}

# -------------------------------------------------------------------------------------------------
# EXAMPLE: Provisioning a Unity Catalog Schema for your dbt environment
# -------------------------------------------------------------------------------------------------
resource "databricks_schema" "dbt_schema" {
  catalog_name = "transform" # Or your Unity Catalog name
  name         = "dbt_${var.environment}"
  comment      = "This schema is managed by Terraform for ${var.environment}"
}
