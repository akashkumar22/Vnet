resource "azurerm_subnet" "example_web_server" {
  name                 = var.Subnet_Name_web_server
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_address_list_web_server

  
}


resource "azurerm_network_security_group" "example_web_server" {
  name                = var.Network_security_Name_web_server
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  
}
resource "azurerm_subnet_network_security_group_association" "example_web_server" {
  subnet_id                 = azurerm_subnet.example_web_server.id
  network_security_group_id = azurerm_network_security_group.example_web_server.id
}
locals {
    web_inboud_ports_map = {
        "100" : "80",
        "110" : "443",
        "120" : "22"

    }
   
}


resource "azurerm_network_security_rule" "example_web_server" {
  for_each = local.web_inboud_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.example_web_server.name
}