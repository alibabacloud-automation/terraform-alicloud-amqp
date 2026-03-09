locals {
  # Instance ID - use created instance or external instance
  instance_id = var.create_instance ? alicloud_amqp_instance.instance[0].id : var.instance_id
}

###################
# AMQP Instance
###################
resource "alicloud_amqp_instance" "instance" {
  count = var.create_instance ? 1 : 0

  instance_name          = var.instance_config.instance_name
  instance_type          = var.instance_config.instance_type
  max_tps                = var.instance_config.max_tps
  queue_capacity         = var.instance_config.queue_capacity
  storage_size           = var.instance_config.storage_size
  support_eip            = var.instance_config.support_eip
  max_eip_tps            = var.instance_config.max_eip_tps
  payment_type           = var.instance_config.payment_type
  period                 = var.instance_config.period
  period_cycle           = var.instance_config.period_cycle
  auto_renew             = var.instance_config.auto_renew
  renewal_status         = var.instance_config.renewal_status
  renewal_duration       = var.instance_config.renewal_duration
  renewal_duration_unit  = var.instance_config.renewal_duration_unit
  serverless_charge_type = var.instance_config.serverless_charge_type
  support_tracing        = var.instance_config.support_tracing
  tracing_storage_time   = var.instance_config.tracing_storage_time
  max_connections        = var.instance_config.max_connections
  modify_type            = var.instance_config.modify_type
  provisioned_capacity   = var.instance_config.provisioned_capacity
  edition                = var.instance_config.edition
}

###################
# Virtual Host
###################
resource "alicloud_amqp_virtual_host" "this" {
  count = var.create_virtual_host ? 1 : 0

  instance_id       = local.instance_id
  virtual_host_name = var.virtual_host_config.virtual_host_name
}

###################
# Exchange
###################
resource "alicloud_amqp_exchange" "this" {
  count = var.create_exchange ? 1 : 0

  instance_id        = local.instance_id
  virtual_host_name  = var.create_virtual_host ? alicloud_amqp_virtual_host.this[0].virtual_host_name : var.exchange_config.virtual_host_name
  exchange_name      = var.exchange_config.exchange_name
  exchange_type      = var.exchange_config.exchange_type
  auto_delete_state  = var.exchange_config.auto_delete_state
  internal           = var.exchange_config.internal
  alternate_exchange = var.exchange_config.alternate_exchange
  x_delayed_type     = var.exchange_config.x_delayed_type
}

###################
# Queue
###################
resource "alicloud_amqp_queue" "this" {
  count = var.create_queue ? 1 : 0

  instance_id             = local.instance_id
  virtual_host_name       = var.create_virtual_host ? alicloud_amqp_virtual_host.this[0].virtual_host_name : var.queue_config.virtual_host_name
  queue_name              = var.queue_config.queue_name
  auto_delete_state       = var.queue_config.auto_delete_state
  max_length              = var.queue_config.max_length
  maximum_priority        = var.queue_config.maximum_priority
  message_ttl             = var.queue_config.message_ttl
  dead_letter_exchange    = var.queue_config.dead_letter_exchange
  dead_letter_routing_key = var.queue_config.dead_letter_routing_key
  auto_expire_state       = var.queue_config.auto_expire_state
}

###################
# Binding
###################
resource "alicloud_amqp_binding" "this" {
  count = var.create_binding ? 1 : 0

  instance_id       = local.instance_id
  virtual_host_name = var.create_virtual_host ? alicloud_amqp_virtual_host.this[0].virtual_host_name : var.binding_config.virtual_host_name
  source_exchange   = var.create_exchange ? alicloud_amqp_exchange.this[0].exchange_name : var.binding_config.source_exchange
  destination_name  = var.binding_config.destination_name
  binding_type      = var.binding_config.binding_type
  binding_key       = var.binding_config.binding_key
  argument          = var.binding_config.argument

  depends_on = [alicloud_amqp_queue.this]
}

###################
# Static Account
###################
resource "alicloud_amqp_static_account" "this" {
  count = var.create_static_account ? 1 : 0

  instance_id = local.instance_id
  access_key  = var.static_account_config.access_key
  secret_key  = var.static_account_config.secret_key
}