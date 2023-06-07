variable "resource_group_name" {
  description = "The name of the resource group in which to create the MariaDB Server."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "server_name" {
  description = "Specifies the name of the MariaDB Server."
}

variable "administrator_login" {
  description = "The Administrator Login for the MariaDB Server. Changing this forces a new resource to be created."
}

variable "administrator_password" {
  description = "The Password associated with the administrator_login for the MariaDB Server."
}

variable "sku_name" {
  description = "Specifies the SKU Name for this MariaDB Server."
  default     = "B_Gen5_2"
}

variable "sku_capacity" {
  description = "The scale up/out capacity, representing server's compute units"
  default     = "2"
}

variable "sku_tier" {
  description = "The tier of the particular SKU. Possible values are Basic, GeneralPurpose, and MemoryOptimized."
  default     = "Basic"
}

variable "sku_family" {
  description = " The family of hardware Gen4 or Gen5."
  default     = "Gen5"
}

variable "storage_mb" {
  description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
  default     = 5120
}

variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  default     = 7
}

variable "geo_redundant_backup" {
  description = "Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier."
  default     = "Disabled"
}

variable "server_version" {
  description = "Specifies the version of MariaDB to use."
  default     = "10.2"
}

variable "ssl_enforcement" {
  description = "Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled."
  default     = "Enabled"
}

variable "db_name" {
  description = "The list of names of the MariaDB Database, which needs to be a valid MariaDB."
  default     = "defaultDB"
}

variable "db_charset" {
  description = "Specifies the Charset for the MariaDB Database, which needs to be a valid MariaDB Charset."
  default     = "utf8"
}

variable "db_collation" {
  description = "Specifies the Collation for the MariaDB Database, which needs to be a valid MariaDB Collation."
  default     = "utf8_general_ci"
}