terraform {
  required_version = ">= 1.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4"
    }
  }
}

provider "azurerm" {
  features {}
}

# Example virtual hub (assuming it exists)
data "azurerm_virtual_hub" "example" {
  name                = "example-vhub"
  resource_group_name = "example-resources"
}

module "route_map" {
  source = "../.."

  route_maps = {
    example = {
      name           = "example-rm"
      virtual_hub_id = data.azurerm_virtual_hub.example.id
      rules = [
        {
          name                 = "rule1"
          next_step_if_matched = "Continue"
          action = {
            type = "Add"
            parameter = {
              as_path = ["22334"]
            }
          }
          match_criterion = {
            match_condition = "Contains"
            route_prefix    = ["10.0.0.0/8"]
          }
        }
      ]
    }
  }
}
