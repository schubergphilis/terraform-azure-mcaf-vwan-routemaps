variable "route_maps" {
  description = "A map of route maps to create"
  type = map(object({
    name           = string
    virtual_hub_id = string
    rules = optional(list(object({
      name                 = string
      next_step_if_matched = optional(string, "Unknown")
      action = optional(object({
        type = string
        parameter = optional(object({
          as_path      = optional(list(string))
          community    = optional(list(string))
          route_prefix = optional(list(string))
        }))
      }))
      match_criterion = optional(object({
        match_condition = string
        as_path         = optional(list(string))
        community       = optional(list(string))
        route_prefix    = optional(list(string))
      }))
    })), [])
  }))
  default = {}
}
