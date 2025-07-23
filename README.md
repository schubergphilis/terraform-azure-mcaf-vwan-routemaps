# terraform-azure-mcaf-vwan-routemap

Terraform module to deploy Azure Virtual WAN Route Maps.

This module creates Azure Route Maps that can be associated with Virtual Hubs to control routing behavior in Azure Virtual WAN.

## Usage

```hcl
module "route_map" {
  source = "schubergphilis/mcaf-vwan-routemap/azure"

  route_maps = {
    example = {
      name           = "example-rm"
      virtual_hub_id = azurerm_virtual_hub.example.id
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
```

## Examples

- [Basic example](examples/basic)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.7 |
| azurerm | ~> 4 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 4 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| route_maps | A map of route maps to create | `map(object({ name = string, virtual_hub_id = string, rules = optional(list(object({ ... })), []) }))` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| route_maps | The route maps that were created |
| route_map_ids | The IDs of the route maps that were created |

## License

Licensed under the Apache License, Version 2.0 (the "License").
