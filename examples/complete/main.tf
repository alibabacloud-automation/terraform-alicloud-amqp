provider "alicloud" {
  region = var.region
}

module "amqp" {
  source = "../../"

  # Instance Configuration
  create_instance = true
  instance_config = {
    instance_name         = var.instance_name
    instance_type         = var.instance_type
    max_tps               = var.max_tps
    max_connections       = var.max_connections
    queue_capacity        = var.queue_capacity
    payment_type          = var.payment_type
    renewal_status        = var.renewal_status
    renewal_duration      = var.renewal_duration
    renewal_duration_unit = var.renewal_duration_unit
    support_eip           = var.support_eip
  }

  # Virtual Host Configuration
  create_virtual_host = true
  virtual_host_config = {
    virtual_host_name = var.virtual_host_name
  }

  # Exchange Configuration
  create_exchange = true
  exchange_config = {
    exchange_name     = var.exchange_name
    exchange_type     = var.exchange_type
    auto_delete_state = var.exchange_auto_delete_state
    internal          = var.exchange_internal
  }

  # Queue Configuration
  create_queue = true
  queue_config = {
    queue_name        = var.queue_name
    auto_delete_state = var.queue_auto_delete_state
  }

  # Binding Configuration
  create_binding = true
  binding_config = {
    destination_name = var.queue_name
    binding_type     = var.binding_type
    binding_key      = var.binding_key
    argument         = var.binding_argument
  }

  # Static Account Configuration
  create_static_account = false
}
