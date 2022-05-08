resource "azurerm_subnet" "example_app" {
  name                 = var.subnet_Name_app
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_address_list__app


}


resource "azurerm_network_security_group" "example_app" {
  name                = var.Network_security_Name_app
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name


}

resource "azurerm_subnet_network_security_group_association" "example_app" {
  subnet_id                 = azurerm_subnet.example_app.id
  network_security_group_id = azurerm_network_security_group.example_app.id
}

locals {
  app_inbound_ports_map = {
    "100" : "80",
    "110" : "443",
    "120" : "33"



  }
}


resource "azurerm_network_security_rule" "example_app" {
  for_each=local.app_inbound_ports_map
  name                        = "PORT_Name-${each.value}"
  priority                    = each.key
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.example_app.name
}