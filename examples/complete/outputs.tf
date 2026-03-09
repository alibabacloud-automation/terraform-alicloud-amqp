output "instance_id" {
  description = "The ID of the AMQP instance"
  value       = module.amqp.instance_id
}

output "instance_status" {
  description = "The status of the AMQP instance"
  value       = module.amqp.instance_status
}

output "instance_create_time" {
  description = "The create time of the AMQP instance"
  value       = module.amqp.instance_create_time
}

output "virtual_host_id" {
  description = "The ID of the AMQP virtual host"
  value       = module.amqp.virtual_host_id
}

output "virtual_host_name" {
  description = "The name of the AMQP virtual host"
  value       = module.amqp.virtual_host_name
}

output "exchange_id" {
  description = "The ID of the AMQP exchange"
  value       = module.amqp.exchange_id
}

output "exchange_name" {
  description = "The name of the AMQP exchange"
  value       = module.amqp.exchange_name
}

output "queue_id" {
  description = "The ID of the AMQP queue"
  value       = module.amqp.queue_id
}

output "queue_name" {
  description = "The name of the AMQP queue"
  value       = module.amqp.queue_name
}

output "binding_id" {
  description = "The ID of the AMQP binding"
  value       = module.amqp.binding_id
}

output "static_account_id" {
  description = "The ID of the AMQP static account"
  value       = module.amqp.static_account_id
}

output "static_account_username" {
  description = "The username of the AMQP static account"
  value       = module.amqp.static_account_username
}
