#local Values Block
locals {

  #use case-1:- shorten the names
  rg_name   = "${var.business_unit}-${var.environment}-${var.resource_group_name}"
  vnet_name = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"

  #user case-2:- common tags to be assigned to all resources
  service_name = "Demo service"
  owner        = "Vikash Verma"
  common_tags = {
    Service = local.service_name
    Owner   = local.owner
  }

  #user case 3: Terraform conditional statements

  #(expression)?if expression is true:if expression is false
  #option 1 is ==
  vnet_address_space = (var.environment == "dev" ? var.vnet_address_space_dev : var.vnet_address_space_all)
  #option 2 is !=
  #vnet_address_space=(var.environment!="dev"? var.vnet_address_space_all:var.vnet_address_space_dev)
  #option 3
  #vnet_address_space = (var.environment == "dev" ? var.vnet_address_space_dev : (var.environment == "stage"? var.vnet_address_space_stage:var.vnet_address_space_all))

}
