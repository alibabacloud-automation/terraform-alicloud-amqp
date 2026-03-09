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
  create_instance = true
  instance_config = {
    instance_name  = "my-rabbitmq-instance"
    instance_type  = "enterprise"
    max_tps        = 3000
    queue_capacity = 200
    payment_type   = "Subscription"
  }

  # 虚拟主机
  create_virtual_host = true
  virtual_host_config = {
    virtual_host_name = "my-vhost"
  }

  # 交换机
  create_exchange = true
  exchange_config = {
    exchange_name     = "my-exchange"
    exchange_type     = "DIRECT"
    auto_delete_state = false
    internal          = false
  }

  # 队列
  create_queue = true
  queue_config = {
    queue_name        = "my-queue"
    auto_delete_state = false
  }

  # 绑定
  create_binding = true
  binding_config = {
    destination_name = "my-queue"
    binding_type     = "QUEUE"
    binding_key      = "routing-key"
  }

  # 静态账号
  create_static_account = true
  static_account_config = {
    access_key = "my_access_key"
    secret_key = "my_secret_key"
  }
}
```

## 示例

* [完整示例](https://github.com/alibabacloud-automation/terraform-alicloud-amqp/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.126.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.126.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_amqp_binding.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/amqp_binding) | resource |
| [alicloud_amqp_exchange.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/amqp_exchange) | resource |
| [alicloud_amqp_instance.instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/amqp_instance) | resource |
| [alicloud_amqp_queue.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/amqp_queue) | resource |
| [alicloud_amqp_static_account.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/amqp_static_account) | resource |
| [alicloud_amqp_virtual_host.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/amqp_virtual_host) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_binding_config"></a> [binding\_config](#input\_binding\_config) | Configuration for AMQP binding | <pre>object({<br/>    virtual_host_name = optional(string, null)<br/>    source_exchange   = optional(string, null)<br/>    destination_name  = optional(string, null)<br/>    binding_type      = string<br/>    binding_key       = string<br/>    argument          = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "binding_key": "default-key",<br/>  "binding_type": "QUEUE"<br/>}</pre> | no |
| <a name="input_create_binding"></a> [create\_binding](#input\_create\_binding) | Whether to create a binding | `bool` | `false` | no |
| <a name="input_create_exchange"></a> [create\_exchange](#input\_create\_exchange) | Whether to create an exchange | `bool` | `false` | no |
| <a name="input_create_instance"></a> [create\_instance](#input\_create\_instance) | Whether to create a new AMQP instance. If false, an existing instance ID must be provided. | `bool` | `true` | no |
| <a name="input_create_queue"></a> [create\_queue](#input\_create\_queue) | Whether to create a queue | `bool` | `false` | no |
| <a name="input_create_static_account"></a> [create\_static\_account](#input\_create\_static\_account) | Whether to create a static account | `bool` | `false` | no |
| <a name="input_create_virtual_host"></a> [create\_virtual\_host](#input\_create\_virtual\_host) | Whether to create a virtual host | `bool` | `false` | no |
| <a name="input_exchange_config"></a> [exchange\_config](#input\_exchange\_config) | Configuration for AMQP exchange | <pre>object({<br/>    virtual_host_name  = optional(string, null)<br/>    exchange_name      = string<br/>    exchange_type      = string<br/>    auto_delete_state  = optional(bool, false)<br/>    internal           = optional(bool, false)<br/>    alternate_exchange = optional(string, null)<br/>    x_delayed_type     = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "exchange_name": "default-exchange",<br/>  "exchange_type": "DIRECT"<br/>}</pre> | no |
| <a name="input_instance_config"></a> [instance\_config](#input\_instance\_config) | Configuration for AMQP instance. Required attributes: instance\_type, max\_tps, queue\_capacity, payment\_type. | <pre>object({<br/>    instance_name          = optional(string, "terraform-amqp-instance")<br/>    instance_type          = string<br/>    max_tps                = number<br/>    queue_capacity         = number<br/>    storage_size           = optional(number, 0)<br/>    support_eip            = optional(bool, false)<br/>    max_eip_tps            = optional(number, null)<br/>    payment_type           = string<br/>    period                 = optional(number, null)<br/>    period_cycle           = optional(string, null)<br/>    auto_renew             = optional(bool, null)<br/>    renewal_status         = optional(string, null)<br/>    renewal_duration       = optional(number, null)<br/>    renewal_duration_unit  = optional(string, null)<br/>    serverless_charge_type = optional(string, null)<br/>    support_tracing        = optional(bool, null)<br/>    tracing_storage_time   = optional(number, null)<br/>    max_connections        = optional(number, null)<br/>    modify_type            = optional(string, null)<br/>    provisioned_capacity   = optional(number, null)<br/>    edition                = optional(string, null)<br/>  })</pre> | n/a | yes |
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | The ID of an existing AMQP instance. Required when create\_instance is false. | `string` | `null` | no |
| <a name="input_queue_config"></a> [queue\_config](#input\_queue\_config) | Configuration for AMQP queue | <pre>object({<br/>    virtual_host_name       = optional(string, null)<br/>    queue_name              = string<br/>    auto_delete_state       = optional(bool, false)<br/>    max_length              = optional(number, null)<br/>    maximum_priority        = optional(number, null)<br/>    message_ttl             = optional(number, null)<br/>    dead_letter_exchange    = optional(string, null)<br/>    dead_letter_routing_key = optional(string, null)<br/>    auto_expire_state       = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "queue_name": "default-queue"<br/>}</pre> | no |
| <a name="input_static_account_config"></a> [static\_account\_config](#input\_static\_account\_config) | Configuration for AMQP static account | <pre>object({<br/>    access_key = string<br/>    secret_key = string<br/>  })</pre> | <pre>{<br/>  "access_key": "default_access_key",<br/>  "secret_key": "default_secret_key"<br/>}</pre> | no |
| <a name="input_virtual_host_config"></a> [virtual\_host\_config](#input\_virtual\_host\_config) | Configuration for AMQP virtual host | <pre>object({<br/>    virtual_host_name = string<br/>  })</pre> | <pre>{<br/>  "virtual_host_name": "default-vhost"<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_binding_id"></a> [binding\_id](#output\_binding\_id) | The ID of the AMQP binding |
| <a name="output_exchange_create_time"></a> [exchange\_create\_time](#output\_exchange\_create\_time) | The create time of the AMQP exchange |
| <a name="output_exchange_id"></a> [exchange\_id](#output\_exchange\_id) | The ID of the AMQP exchange |
| <a name="output_exchange_name"></a> [exchange\_name](#output\_exchange\_name) | The name of the AMQP exchange |
| <a name="output_instance_create_time"></a> [instance\_create\_time](#output\_instance\_create\_time) | The create time of the AMQP instance |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The ID of the AMQP instance |
| <a name="output_instance_status"></a> [instance\_status](#output\_instance\_status) | The status of the AMQP instance |
| <a name="output_queue_id"></a> [queue\_id](#output\_queue\_id) | The ID of the AMQP queue |
| <a name="output_queue_name"></a> [queue\_name](#output\_queue\_name) | The name of the AMQP queue |
| <a name="output_static_account_create_time"></a> [static\_account\_create\_time](#output\_static\_account\_create\_time) | The create time of the AMQP static account |
| <a name="output_static_account_id"></a> [static\_account\_id](#output\_static\_account\_id) | The ID of the AMQP static account |
| <a name="output_static_account_password"></a> [static\_account\_password](#output\_static\_account\_password) | The password of the AMQP static account |
| <a name="output_static_account_username"></a> [static\_account\_username](#output\_static\_account\_username) | The username of the AMQP static account |
| <a name="output_virtual_host_id"></a> [virtual\_host\_id](#output\_virtual\_host\_id) | The ID of the AMQP virtual host |
| <a name="output_virtual_host_name"></a> [virtual\_host\_name](#output\_virtual\_host\_name) | The name of the AMQP virtual host |
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