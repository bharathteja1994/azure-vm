variable "workspace_name" {
  description = "The name of the Log Analytics Workspace."
  type        = string
}

variable "location" {
  description = "The location of the Log Analytics Workspace."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name where the Log Analytics Workspace will be located."
  type        = string
}

variable "sku" {
  description = "The SKU of the Log Analytics Workspace."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "The workspace data retention in days."
  type        = number
  default     = 30
}

variable "daily_quota_gb" {
  description = "The workspace daily quota for ingestion in GB."
  type        = number
  default     = -1
}

variable "allow_resource_only_permissions" {
  description = "Whether to allow resource-only permissions."
  type        = bool
  default     = true
}

variable "local_authentication_disabled" {
  description = "Specifies if the log Analytics workspace should enforce Azure AD authentication."
  type        = bool
  default     = false
}

variable "internet_ingestion_enabled" {
  description = "Whether to enable ingestion over the public Internet."
  type        = bool
  default     = true
}

variable "internet_query_enabled" {
  description = "Whether to enable querying over the public Internet."
  type        = bool
  default     = true
}

variable "reservation_capacity_in_gb_per_day" {
  description = "The capacity reservation level in GB for this workspace."
  type        = number
  default     = null
}

variable "cmk_for_query_forced" {
  description = "Is Customer Managed Storage mandatory for query management?"
  type        = bool
  default     = false
}

variable "data_collection_rule_id" {
  description = "The ID of the Data Collection Rule to use for this workspace."
  type        = string
  default     = null
}

variable "immediate_data_purge_on_30_days_enabled" {
  description = "Whether to remove the data immediately after 30 days."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "identity_type" {
  description = "Specifies the identity type of the Log Analytics Workspace."
  type        = string
  default     = "SystemAssigned"
}

variable "identity_ids" {
  description = "Specifies a list of user managed identity ids to be assigned."
  type        = list(string)
  default     = []
}
