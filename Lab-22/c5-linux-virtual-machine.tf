resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  name                  = "azurevm"
  computer_name         = "azurevmc"
  resource_group_name   = azurerm_resource_group.myrg.name
  location              = azurerm_resource_group.myrg.location
  size                  = "Standard_DS1_v2"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.myvmnic.id]
  admin_password        = "Azureuser!123"
  disable_password_authentication=false
  os_disk {
    name                 = "os_disk_1"
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  tags = {
    "vm" = "Linux"
  }
}
