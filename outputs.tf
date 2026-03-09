###################
# Instance Outputs
###################
output "instance_id" {
  description = "The ID of the AMQP instance"
  value       = local.instance_id
}

output "instance_status" {
  description = "The status of the AMQP instance"
  value       = var.create_instance ? alicloud_amqp_instance.instance[0].status : null
}

output "instance_create_time" {
  description = "The create time of the AMQP instance"
  value       = var.create_instance ? alicloud_amqp_instance.instance[0].create_time : null
}

###################
# Virtual Host Outputs
###################
output "virtual_host_id" {
  description = "The ID of the AMQP virtual host"
  value       = var.create_virtual_host ? alicloud_amqp_virtual_host.this[0].id : null
}

output "virtual_host_name" {
  description = "The name of the AMQP virtual host"
  value       = var.create_virtual_host ? alicloud_amqp_virtual_host.this[0].virtual_host_name : null
}

###################
# Exchange Outputs
###################
output "exchange_id" {
  description = "The ID of the AMQP exchange"
  value       = var.create_exchange ? alicloud_amqp_exchange.this[0].id : null
}

output "exchange_name" {
  description = "The name of the AMQP exchange"
  value       = var.create_exchange ? alicloud_amqp_exchange.this[0].exchange_name : null
}

output "exchange_create_time" {
  description = "The create time of the AMQP exchange"
  value       = var.create_exchange ? alicloud_amqp_exchange.this[0].create_time : null
}

###################
# Queue Outputs
###################
output "queue_id" {
  description = "The ID of the AMQP queue"
  value       = var.create_queue ? alicloud_amqp_queue.this[0].id : null
}

output "queue_name" {
  description = "The name of the AMQP queue"
  value       = var.create_queue ? alicloud_amqp_queue.this[0].queue_name : null
}

###################
# Binding Outputs
###################
output "binding_id" {
  description = "The ID of the AMQP binding"
  value       = var.create_binding ? alicloud_amqp_binding.this[0].id : null
}

###################
# Static Account Outputs
###################
output "static_account_id" {
  description = "The ID of the AMQP static account"
  value       = var.create_static_account ? alicloud_amqp_static_account.this[0].id : null
}

output "static_account_username" {
  description = "The username of the AMQP static account"
  value       = var.create_static_account ? alicloud_amqp_static_account.this[0].user_name : null
}

output "static_account_password" {
  description = "The password of the AMQP static account"
  value       = var.create_static_account ? alicloud_amqp_static_account.this[0].password : null
  sensitive   = true
}

output "static_account_create_time" {
  description = "The create time of the AMQP static account"
  value       = var.create_static_account ? alicloud_amqp_static_account.this[0].create_time : null
}
