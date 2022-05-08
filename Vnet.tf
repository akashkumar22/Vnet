resource "azurerm_virtual_network" "example" {
  name                = var.Virtual_Network_Name
  location            = var.Location_Name
  resource_group_name = var.Resource_Group_Name
  address_space       = var.Address_space



}