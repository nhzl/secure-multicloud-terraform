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
  https_traffic_only_enabled = true

  blob_properties {
  delete_retention_policy {
    days = 1
  }

  container_delete_retention_policy {
    days = 1
  }
  # No direct allow_blob_public_access here anymore
  }

  tags = {
    Environment = "dev"
    Project     = "secure-multicloud"
  }
}
