###################
# Instance Configuration
###################
variable "create_instance" {
  description = "Whether to create a new AMQP instance. If false, an existing instance ID must be provided."
  type        = bool
  default     = true
}

variable "instance_id" {
  description = "The ID of an existing AMQP instance. Required when create_instance is false."
  type        = string
  default     = null
}

variable "instance_config" {
  description = "Configuration for AMQP instance. Required attributes: instance_type, max_tps, queue_capacity, payment_type."
  type = object({
    instance_name          = optional(string, "terraform-amqp-instance")
    instance_type          = string
    max_tps                = number
    queue_capacity         = number
    storage_size           = optional(number, 0)
    support_eip            = optional(bool, false)
    max_eip_tps            = optional(number, null)
    payment_type           = string
    period                 = optional(number, null)
    period_cycle           = optional(string, null)
    auto_renew             = optional(bool, null)
    renewal_status         = optional(string, null)
    renewal_duration       = optional(number, null)
    renewal_duration_unit  = optional(string, null)
    serverless_charge_type = optional(string, null)
    support_tracing        = optional(bool, null)
    tracing_storage_time   = optional(number, null)
    max_connections        = optional(number, null)
    modify_type            = optional(string, null)
    provisioned_capacity   = optional(number, null)
    edition                = optional(string, null)
  })
}

###################
# Virtual Host Configuration
###################
variable "create_virtual_host" {
  description = "Whether to create a virtual host"
  type        = bool
  default     = false
}

variable "virtual_host_config" {
  description = "Configuration for AMQP virtual host"
  type = object({
    virtual_host_name = string
  })
  default = {
    virtual_host_name = "default-vhost"
  }
}

###################
# Exchange Configuration
###################
variable "create_exchange" {
  description = "Whether to create an exchange"
  type        = bool
  default     = false
}

variable "exchange_config" {
  description = "Configuration for AMQP exchange"
  type = object({
    virtual_host_name  = optional(string, null)
    exchange_name      = string
    exchange_type      = string
    auto_delete_state  = optional(bool, false)
    internal           = optional(bool, false)
    alternate_exchange = optional(string, null)
    x_delayed_type     = optional(string, null)
  })
  default = {
    exchange_name = "default-exchange"
    exchange_type = "DIRECT"
  }
}

###################
# Queue Configuration
###################
variable "create_queue" {
  description = "Whether to create a queue"
  type        = bool
  default     = false
}

variable "queue_config" {
  description = "Configuration for AMQP queue"
  type = object({
    virtual_host_name       = optional(string, null)
    queue_name              = string
    auto_delete_state       = optional(bool, false)
    max_length              = optional(number, null)
    maximum_priority        = optional(number, null)
    message_ttl             = optional(number, null)
    dead_letter_exchange    = optional(string, null)
    dead_letter_routing_key = optional(string, null)
    auto_expire_state       = optional(string, null)
  })
  default = {
    queue_name = "default-queue"
  }
}

###################
# Binding Configuration
###################
variable "create_binding" {
  description = "Whether to create a binding"
  type        = bool
  default     = false
}

variable "binding_config" {
  description = "Configuration for AMQP binding"
  type = object({
    virtual_host_name = optional(string, null)
    source_exchange   = optional(string, null)
    destination_name  = optional(string, null)
    binding_type      = string
    binding_key       = string
    argument          = optional(string, null)
  })
  default = {
    binding_type = "QUEUE"
    binding_key  = "default-key"
  }
}

###################
# Static Account Configuration
###################
variable "create_static_account" {
  description = "Whether to create a static account"
  type        = bool
  default     = false
}

variable "static_account_config" {
  description = "Configuration for AMQP static account"
  type = object({
    access_key = string
    secret_key = string
  })
  default = {
    access_key = "default_access_key"
    secret_key = "default_secret_key"
  }
}
