阿里云 AMQP (RabbitMQ) Terraform 模块

# terraform-alicloud-amqp

[English](https://github.com/alibabacloud-automation/terraform-alicloud-amqp/blob/main/README.md) | 简体中文

在阿里云上创建 AMQP (RabbitMQ) 资源的 Terraform 模块。此模块提供 RabbitMQ 消息队列服务的全面管理，包括实例、虚拟主机、交换机、队列、绑定和静态账号。RabbitMQ 是一个可靠且可扩展的消息代理，支持[分布式应用程序之间的高效消息队列和通信](https://www.alibabacloud.com/product/rabbitmq)。

## 使用方法

创建完整的 AMQP 设置，使用默认配置：

```terraform
module "amqp" {
  source = "alibabacloud-automation/amqp/alicloud"

  # 实例配置
  instance_config = {
    instance_name  = "my-rabbitmq-instance"
    instance_type  = "enterprise"
    max_tps        = 3000
    queue_capacity = 200
    payment_type   = "Subscription"
  }

  # 虚拟主机
  virtual_hosts_config = {
    "default" = {
      virtual_host_name = "my-vhost"
    }
  }

  # 交换机
  exchanges_config = {
    "main" = {
      virtual_host_name = "my-vhost"
      exchange_name     = "my-exchange"
      exchange_type     = "DIRECT"
      auto_delete_state = false
      internal          = false
    }
  }

  # 队列
  queues_config = {
    "main" = {
      virtual_host_name = "my-vhost"
      queue_name        = "my-queue"
      auto_delete_state = false
    }
  }

  # 绑定
  bindings_config = {
    "main" = {
      virtual_host_name = "my-vhost"
      source_exchange   = "my-exchange"
      destination_name  = "my-queue"
      binding_type      = "QUEUE"
      binding_key       = "routing-key"
    }
  }

  # 静态账号
  static_accounts_config = {
    "app" = {
      access_key = "my_access_key"
      secret_key = "my_secret_key"
    }
  }
}
```

## 示例

* [完整示例](https://github.com/alibabacloud-automation/terraform-alicloud-amqp/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)