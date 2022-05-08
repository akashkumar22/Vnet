resource "azurerm_virtual_network" "example" {
  name                = var.Virtual_Network_Name
  location            = var.Location_Name
  resource_group_name = var.Resource_Group_Name
  address_space       = Var.Address_space

  

  tags = {
    environment = local.common_tags
  }

}