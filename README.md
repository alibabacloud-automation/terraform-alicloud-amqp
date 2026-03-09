Alibaba Cloud AMQP (RabbitMQ) Terraform Module

# terraform-alicloud-amqp

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-amqp/blob/main/README-CN.md)

Terraform module which creates AMQP (RabbitMQ) resources on Alibaba Cloud. This module provides comprehensive management of RabbitMQ message queue services, including instances, virtual hosts, exchanges, queues, bindings, and static accounts. RabbitMQ is a reliable and scalable message broker that enables [efficient message queuing and communication between distributed applications](https://www.alibabacloud.com/product/rabbitmq).

## Usage

To create a complete AMQP setup with default configuration:

```terraform
module "amqp" {
  source = "alibabacloud-automation/amqp/alicloud"

  # Instance Configuration
  instance_config = {
    instance_name  = "my-rabbitmq-instance"
    instance_type  = "enterprise"
    max_tps        = 3000
    queue_capacity = 200
    payment_type   = "Subscription"
  }

  # Virtual Hosts
  virtual_hosts_config = {
    "default" = {
      virtual_host_name = "my-vhost"
    }
  }

  # Exchanges
  exchanges_config = {
    "main" = {
      virtual_host_name = "my-vhost"
      exchange_name     = "my-exchange"
      exchange_type     = "DIRECT"
      auto_delete_state = false
      internal          = false
    }
  }

  # Queues
  queues_config = {
    "main" = {
      virtual_host_name = "my-vhost"
      queue_name        = "my-queue"
      auto_delete_state = false
    }
  }

  # Bindings
  bindings_config = {
    "main" = {
      virtual_host_name = "my-vhost"
      source_exchange   = "my-exchange"
      destination_name  = "my-queue"
      binding_type      = "QUEUE"
      binding_key       = "routing-key"
    }
  }

  # Static Accounts
  static_accounts_config = {
    "app" = {
      access_key = "my_access_key"
      secret_key = "my_secret_key"
    }
  }
}
```

## Examples

* [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-amqp/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)