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