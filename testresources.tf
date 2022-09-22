resource "azurerm_resource_group" "testrg" {
  name     = "sgrimesProject3TestRG"
  location = "eastus"
}


resource "azurerm_virtual_network" "example" {
  name                = "sgrimesProject3Test-network"
  location            = azurerm_resource_group.testrg.location
  resource_group_name = azurerm_resource_group.testrg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  tags = {
    environment = "Project3Test"
  }
}
