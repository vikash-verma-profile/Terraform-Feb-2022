#resource block
resource "azurerm_resource_group" "myrg" {
  name="myrg"
  provider = azurerm.eastus
}