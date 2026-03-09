variable "region" {
  description = "The region where to deploy the resources"
  type        = string
  default     = "eu-central-1"
}

###################
# Instance Configuration
###################
variable "instance_name" {
  description = "The name of the AMQP instance"
  type        = string
  default     = "terraform-amqp-example"
}

variable "instance_type" {
  description = "The type of the AMQP instance"
  type        = string
  default     = "enterprise"
}

variable "max_tps" {
  description = "The maximum TPS of the AMQP instance"
  type        = number
  default     = 3000
}

variable "queue_capacity" {
  description = "The queue capacity of the AMQP instance"
  type        = number
  default     = 200
}

variable "max_connections" {
  description = "The maximum connections of the AMQP instance"
  type        = number
  default     = 2000
}

variable "support_eip" {
  description = "Whether to support EIP"
  type        = bool
  default     = true
}

variable "payment_type" {
  description = "The payment type of the AMQP instance"
  type        = string
  default     = "Subscription"
}

variable "renewal_status" {
  description = "The renewal status of the AMQP instance"
  type        = string
  default     = "AutoRenewal"
}

variable "renewal_duration" {
  description = "The renewal duration of the AMQP instance"
  type        = number
  default     = 1
}

variable "renewal_duration_unit" {
  description = "The renewal duration unit of the AMQP instance"
  type        = string
  default     = "Year"
}

###################
# Virtual Host Configuration
###################
variable "virtual_host_name" {
  description = "The name of the virtual host"
  type        = string
  default     = "tf-example"
}

###################
# Exchange Configuration
###################
variable "exchange_name" {
  description = "The name of the exchange"
  type        = string
  default     = "tf-example-exchange"
}

variable "exchange_type" {
  description = "The type of the exchange"
  type        = string
  default     = "DIRECT"
}

variable "exchange_auto_delete_state" {
  description = "Whether the exchange is auto-deleted"
  type        = bool
  default     = false
}

variable "exchange_internal" {
  description = "Whether the exchange is internal"
  type        = bool
  default     = false
}

###################
# Queue Configuration
###################
variable "queue_name" {
  description = "The name of the queue"
  type        = string
  default     = "tf-example-queue"
}

variable "queue_auto_delete_state" {
  description = "Whether the queue is auto-deleted"
  type        = bool
  default     = false
}

###################
# Binding Configuration
###################
variable "binding_type" {
  description = "The type of the binding"
  type        = string
  default     = "QUEUE"
}

variable "binding_key" {
  description = "The binding key"
  type        = string
  default     = "tf-example-key"
}

variable "binding_argument" {
  description = "The binding argument"
  type        = string
  default     = null
}

