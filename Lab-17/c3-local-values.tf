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
}
