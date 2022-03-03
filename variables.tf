# variables.tf

variable "teamsurl" {
  default = "<INSERT TEAMS WEBHOOK>"
  description = "The url for calling teams"
  type = string

  validation {
     condition     = length(var.teamsurl) > 50
     error_message = "The resource_name must be greater than 50 characters."
  }
  validation {
     condition     = can(regex("^https://*.webhook.office.com/webhookb2", var.teamsurl))
     error_message = "The URL must be talking to office."
  }
}

variable "title" {
  default = "Default Title for message"
  type = string

  validation {
     condition     = length(var.title) > 5
     error_message = "The title must be greater than 5 characters."
  }
}

variable "message" {
 default = "Default Message"
 type = string

  validation {
     condition     = length(var.message) > 5
     error_message = "The message must be greater than 5 characters."
  }
}

