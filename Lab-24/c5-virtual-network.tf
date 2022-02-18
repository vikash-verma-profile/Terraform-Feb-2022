# resource "azurerm_virtual_network" "myvnet" {
#   name = local.vnet_name
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.myrg.location
#   resource_group_name = azurerm_resource_group.myrg.name
#   tags                = local.common_tags
# }
module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "2.5.0"
  resource_group_name=azurerm_resource_group.myrg.name
  vnet_location =azurerm_resource_group.myrg.location
  tags=local.common_tags
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes =["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
  subnet_names =[ "subnet1", "subnet2", "subnet3" ]
  subnet_service_endpoints ={
    subnet2=["Microsoft.Storage","Microsoft.Sql"],
    subnet3=["Microsoft.AzureActiveDirectory"]
  }
  depends_on = [
    azurerm_resource_group.myrg
  ]
}
#create public ip address
resource "azurerm_public_ip" "mypublicIp" {
  depends_on = [
    azurerm_virtual_network.myvnet,
    azurerm_subnet.mysubnet
  ]
  name                = "mypublicIp-1"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = "Static"
  tags = {
    environment = "Dev"
  }
}

# network interface
resource "azurerm_network_interface" "myvmnic" {
  name                = "vmnic"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.vnet.vnet_subnets[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypublicIp.id
  }
}