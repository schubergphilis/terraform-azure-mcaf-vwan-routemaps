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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_route_map.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_map) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_route_maps"></a> [route\_maps](#input\_route\_maps) | A map of route maps to create | <pre>map(object({<br/>    name           = string<br/>    virtual_hub_id = string<br/>    rules = optional(list(object({<br/>      name                 = string<br/>      next_step_if_matched = optional(string)<br/>      action = optional(object({<br/>        type = string<br/>        parameter = optional(object({<br/>          as_path      = optional(list(string))<br/>          community    = optional(list(string))<br/>          route_prefix = optional(list(string))<br/>        }))<br/>      }))<br/>      match_criterion = optional(object({<br/>        match_condition = string<br/>        as_path         = optional(list(string))<br/>        community       = optional(list(string))<br/>        route_prefix    = optional(list(string))<br/>      }))<br/>    })), [])<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route_map_ids"></a> [route\_map\_ids](#output\_route\_map\_ids) | The IDs of the route maps that were created |
<!-- END_TF_DOCS -->