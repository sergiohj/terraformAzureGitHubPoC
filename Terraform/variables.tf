variable "terraformrgname" {
  description = "Resource group for terraform"
  type        = string
  default     = "TerraformTest"
}
variable "terraformstorageaccountname" {
  description   = ""
  type          = string
  default       = "terraformstatepocshj"
}
variable "terraformcontainername" {
  description   = ""
  type          = string
  default       = "tfstatedevops"
}
variable "keytfstate" {
  description   = ""
  type          = string
  default       = "tfstatedevops.tfstate"
}
variable "rgname" {
  description   = ""
  type          = string
  default       = "tamops"
}
variable "region" {
  description = "Azure region to be used to deploy"
  type        = string
  default     = "West Europe"
}