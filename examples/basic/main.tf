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

module "route_map" {
  source = "../.."

  route_maps = {
    example = {
      name           = "example-rm"
      virtual_hub_id = "Resource ID of your Virtual Hub"
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
            route_prefix    = ["10.1.0.0/24"]
          }
        }
      ]
    }
  }
}
