terraform {
  backend "azurerm" {
    storage_account_name = "infrastatefile"
    container_name       = "infratf"
    key                  = "terraform.tfstate"
    resource_group_name = "Final_POC"
  }
}
