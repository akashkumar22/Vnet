resource "azurerm_subnet" "example_db" {
  name                 = var.Subnet_Name_db
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_address_list_db

  
}


resource "azurerm_network_security_group" "example_db" {
  name                = var.Network_security_Name_db
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  
}
resource "azurerm_subnet_network_security_group_association" "example_db" {
  subnet_id                 = azurerm_subnet.example_db.id
  network_security_group_id = azurerm_network_security_group.example_db.id
}
locals {
    db_inbound_ports_map={
        "100" : "3306",
        "110" : "1433",
        "120" : "5432"
    }
}


resource "azurerm_network_security_rule" "example_db" {
  for_each=local.db_inbound_ports_map
  name                        = "Rule-port-${each.value}"
  priority                    = each.key
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.example_db.name
}