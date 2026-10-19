terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.35.0"
    }
    # restapi = {
    #   source  = "KirillMeleshko/restapi"
    #   version = "1.15.0"
    # }
    # azapi = {
    #   source = "Azure/azapi"
    # }
    everllence = {
      source  = "app.terraform.io/manes-central/everllence"
      version = "1.4.2"
    }
    # random = {
    #   source  = "hashicorp/random"
    #   version = "3.7.2"
    # }
  }
}

