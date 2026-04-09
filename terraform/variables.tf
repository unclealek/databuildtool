variable "databricks_host" {
  description = "The URL of the Databricks Workspace (e.g. https://adb-1234.azuredatabricks.net/)"
  type        = string
}

variable "databricks_token" {
  description = "The Service Principal or PAT token for Databricks"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "The deployment environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}
