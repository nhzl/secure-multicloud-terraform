resource "azurerm_resource_group" "rg" {
  name     = "rg-secure-multicloud"
  location = var.location
}

resource "azurerm_storage_account" "secure_storage" {
  name                     = var.storage_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = false
  enable_https_traffic_only = true

  tags = {
    Environment = "dev"
    Project     = "secure-multicloud"
  }
}
