
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
variable "resource_group_location" {
  description="Resource Group Location"
  type = string
  default = "East US"
}
#Virtual Network Name
variable "virtual_network_name" {
  description="Virtual Network Name"
  type = string
  default = "myvnet"
}