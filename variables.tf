########################################
# General Settings
########################################

variable "resource_group_name" {
  description = "Name of the Resource Group."
  type        = string
  nullable    = false

  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "resource_group_name cannot be empty."
  }
}

variable "app_name" {
  description = "Application name."
  type        = string
  nullable    = false
}

variable "short_env" {
  description = "Short environment name (dev, test, prod, etc.)."
  type        = string
  nullable    = false
}

variable "tags" {
  description = "Tags applied to resources."
  type        = map(string)
  default     = {}
}

########################################
# Workspace Configuration
########################################

variable "create_workspace" {
  description = "Create a new Log Analytics Workspace or use an existing one."
  type        = bool
  default     = true
}

variable "existing_workspace_name" {
  description = "Existing Log Analytics Workspace name."
  type        = string
  default     = null
}

variable "existing_workspace_rg" {
  description = "Resource Group of the existing Log Analytics Workspace."
  type        = string
  default     = null
}

variable "workspace_sku" {
  description = "Log Analytics Workspace SKU."
  type        = string
  default     = "PerGB2018"

  validation {
    condition = contains(
      ["PerGB2018", "Free", "Standalone", "CapacityReservation"],
      var.workspace_sku
    )
    error_message = "Supported values: PerGB2018, Free, Standalone, CapacityReservation."
  }
}

variable "retention_in_days" {
  description = "Retention period for Log Analytics Workspace."
  type        = number
  default     = 30

  validation {
    condition     = var.retention_in_days >= 30 && var.retention_in_days <= 730
    error_message = "Retention period must be between 30 and 730 days."
  }
}

variable "daily_quota_gb" {
  description = "Daily ingestion quota in GB."
  type        = number
  default     = -1
}

########################################
# Application Insights
########################################

variable "application_type" {
  description = "Application Insights application type."
  type        = string
  default     = "web"

  validation {
    condition = contains(
      ["web", "other"],
      var.application_type
    )
    error_message = "Supported values are web and other."
  }
}
