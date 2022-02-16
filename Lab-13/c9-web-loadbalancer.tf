#public ip for azure load balancer

resource "azurerm_public_ip" "web_lbpublic" {
  name                = "lbpublicip"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    environment = "Dev"
  }
}

#create azure load balancer
resource "azurerm_lb" "weblb" {
  name                = "web-lb-1"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "web-lb-publicip-1"
    public_ip_address_id = azurerm_public_ip.web_lbpublic.id
  }

}
#create LB Backend Pool
resource "azurerm_lb_backend_address_pool" "web_lb_backend_address_pool" {
  name            = "web-backend"
  loadbalancer_id = azurerm_lb.weblb.id
}

#create Lb Probe

resource "azurerm_lb_probe" "web_lb_probe" {
  name                = "tcp-probe"
  protocol            = "TCP"
  port                = 80
  loadbalancer_id     = azurerm_lb.weblb.id
  resource_group_name = azurerm_resource_group.myrg.name
}

#create LB Rule
resource "azurerm_lb_rule" "web_lb_rule_app1" {
  name                           = "web-app1-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.weblb.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id]
  probe_id                       = azurerm_lb_probe.web_lb_probe.id
  loadbalancer_id                = azurerm_lb.weblb.id
  resource_group_name            = azurerm_resource_group.myrg.name
}

#Associate network interface and standard load balancer

# resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_associate" {
#   #network_interface_id    = azurerm_network_interface.web-vmss-nic.id
#   network_interface_id=""
#   ip_configuration_name   = azurerm_lb.weblb.frontend_ip_configuration[0].name
#   backend_address_pool_id = azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id
# }
