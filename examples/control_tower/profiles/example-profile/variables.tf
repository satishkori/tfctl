# This variable must always be present in a profile
variable "config" {
  description = "Configuration generated by tfctl"
  type        = string
}

locals {
  config     = jsondecode(var.config)
  account_id = "${data.aws_caller_identity.current.account_id}"
  # get current account configuration from tfctl config
  account    = [ for account in local.config["accounts"]: account if account["id"] == local.account_id ][0]
}
