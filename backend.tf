terraform {
  backend "azurerm" {
    storage_account_name = "infrastatefile"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    resource_group_name = "3-tier"
  }
}
