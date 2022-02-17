
#business Unit
variable "business_unit"{
  description="Business Unit Name"
  type = string
  default = "hr"
}

#Environment Name
variable "environment"{
  description="Environment Name"
  type = string
  default = "dev"
}
#Resource Group Name
variable "resource_group_name"{
  description="Resource Group Name"
  type = string
  default = "myreg"
}
#Resource Group Location

# == !=  || or && AND 
/*(expression one)||(expression two) if any of them is true it will work 
if both are false then it will given false
true || true final result true
false || true final result true
true || false final result true
false || false final result false

for AND

true && true final result true
false && true final result false
true && false final result false
false && false final result false

*/
variable "resource_group_location" {
  description="Resource Group Location"
  type = string
  validation {
    condition=var.resource_group_location=="eastus" || var.resource_group_location=="eastus2"
    error_message = "We only allow Resources to be created in eastus or eastus2 locations."
  }
}
#Virtual Network Name
variable "virtual_network_name" {
  description="Virtual Network Name"
  type = string
  default = "myvnet"
}
#virtual network address -dev
variable "vnet_address_space_dev" {
  description="Virtual Network Address Space for Dev Environment"
  type = list(string)
  default = ["10.0.0.0/16"]
}
#virtual network address -All
variable "vnet_address_space_all" {
  description="Virtual Network Address Space for All Environment except dev"
  type = list(string)
  default = ["10.0.0.0/16","10.2.0.0/16","10.3.0.0/16"]
}