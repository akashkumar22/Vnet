resource "azurerm_subnet" "example_bastion" {
  name                 = var.Subnet_Name_bastion
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_address_list__bastion


}


resource "azurerm_network_security_group" "example_bastion" {
  name                = var.Network_security_Name_Bastion
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name


}

resource "azurerm_subnet_network_security_group_association" "example_bastion" {
  subnet_id                 = azurerm_subnet.example_bastion.id
  network_security_group_id = azurerm_network_security_group.example_bastion.id
}
locals {
  bastion_inbound_ports_map = {
    "100" : "22",
    "110" : "3389"
  }
}

resource "azurerm_network_security_rule" "example_bastion" {
  for_each=local.bastion_inbound_ports_map
  name                        = "Port_name-${each.value}"
  priority                    = each.key
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.example_bastion.name
}