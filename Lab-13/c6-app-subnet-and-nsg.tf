
#create subnet
resource "azurerm_subnet" "appsubnet" {
  name                 = "appsubnet-1"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.11.0/24"]
}

#network security group(NSG)
resource "azurerm_network_security_group" "app_subnet_nsg" {
  name                = "app-nsg"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
}
#associate subnet and nsg

resource "azurerm_subnet_network_security_group_association" "app_subnet_nsg_associate" {
  depends_on = [
    azurerm_network_security_rule.app_nsg_rule_inbound
  ]
  subnet_id                 = azurerm_subnet.appsubnet.id
  network_security_group_id = azurerm_network_security_group.app_subnet_nsg.id
}

#create NSG Rules
resource "azurerm_network_security_rule" "app_nsg_rule_inbound" {
  for_each = {
    "100" : "80"
    "110" : "443",
    "120" : "8080"
    "130" : "22"
  }

  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myrg.name
  network_security_group_name = azurerm_network_security_group.app_subnet_nsg.name
}

