variable "terraformrgname" {
  description = "Resource group for terraform"
  type        = string
  default     = "TerraformTest"
}
variable "terraformstorageaccountname" {
  description = "Storage account name"
  type        = string
  default     = "terraformstatepocshj"
}
variable "terraformcontainername" {
  description = "Storage container name"
  type        = string
  default     = "tfstatedevops"
}
variable "keytfstate" {
  description = "Key tftState"
  type        = string
  default     = "tfstatedevops.tfstate"
}
variable "rgname" {
  description = "Resource Group Name"
  type        = string
  default     = "tamops"
}
variable "region" {
  description = "Azure region to be used to deploy"
  type        = string
  default     = "West Europe"
}
