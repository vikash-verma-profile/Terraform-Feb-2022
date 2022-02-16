#resource block
resource "azurerm_resource_group" "myrg" {
  name="myreg-1"
  location=var.location
}