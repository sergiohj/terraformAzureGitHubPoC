variable "region" {
  description = "Azure region to be used to deploy"
  type        = string
  default     = "West Europe"
}
variable "resourgroupname" {
  description = "Resource group name to be used to deploy resources"
  type        = string
  default     = "TerraformTestPoC"
}
variable "sqlservername" {
  description = "SQL server name to deploy"
  type        = string
  default     = "mssqlservershj"
}
variable "sqlserverusername" {
  description = "SQL server username"
  type        = string
  default     = "4dm1n157r470r"
}
variable "sqlserverpassword" {
  description = "SQL server password"
  type        = string
  default     = "4-v3ry-53cr37-p455w0rd"
}
variable "sqlserverversion" {
  description = "SQL server version"
  type        = string
  default     = "12.0"
}
variable "sqlserverdatabasename" {
  description = "SQL server database name"
  type        = string
  default     = "acctest-db-d"
}
variable "sqlserverdatabaseskuname" {
  description = "SQL server sku name"
  type        = string
  default     = "Free"
}
variable "keyvaultname" {
  description = "KeyVault name"
  type        = string
  default     = "mykeyvaultshjpoc"
}
variable "keyvaultskuname" {
  description = "KeyVault sku name"
  type        = string
  default     = "standard"
}
variable "appinsightname" {
  description = "Application insight name"
  type        = string
  default     = "tf-test-appinsights"
}
variable "loganalyticsname" {
  description = "Log Analytics name"
  type        = string
  default     = "acctest-01"
}
