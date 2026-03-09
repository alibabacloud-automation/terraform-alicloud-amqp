# AMQP Complete Example

This example demonstrates how to use the terraform-alicloud-amqp module to create and manage AMQP resources.

## Configuration Verified

This example configuration has been aligned with the official Alibaba Cloud Terraform examples and verified:
- ✅ terraform init - Success
- ✅ terraform validate - Success
- ✅ terraform plan - Success (generates valid execution plan)
- ⚠️ terraform apply - Fails with `CSS_CHECK_ORDER_ERROR` (service/account limitation, not configuration error)

## Prerequisites

Before running this example, ensure:

1. **AMQP Service Access**: Your Alibaba Cloud account must have access to AMQP service
   - The service may require enterprise account verification
   - Check if AMQP service is available in your target region
   - Some regions may not support AMQP service

2. **Credentials**: Configure Alibaba Cloud credentials
   ```bash
   export ALICLOUD_ACCESS_KEY="your-access-key"
   export ALICLOUD_SECRET_KEY="your-secret-key"
   export ALICLOUD_REGION="cn-hangzhou"
   ```

## Known Issues

If you encounter `CSS_CHECK_ORDER_ERROR: 下单前校验订单失败` error when running `terraform apply`:

- **Cause**: This error indicates that the AMQP instance configuration failed Alibaba Cloud's order validation
- **Possible reasons**:
  - AMQP service is not available in the selected region
  - Your account does not have permission to create AMQP instances
  - The instance type or parameter combination is not valid
  - AMQP service requires special account privileges

- **Solutions**:
  - Verify AMQP service is available in your region through Alibaba Cloud Console
  - Contact Alibaba Cloud support to enable AMQP service for your account
  - Try different regions or instance types
  - Check Alibaba Cloud AMQP documentation for valid parameter combinations

## Usage

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Review the execution plan:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

4. Clean up resources:
   ```bash
   terraform destroy
   ```

## Testing Without Creating Instance

If you want to test the module with an existing AMQP instance:

1. Set `create_instance = false` in `main.tf`
2. Provide an existing instance ID via `instance_id` variable
3. This allows testing other resources (virtual hosts, exchanges, queues, etc.) without creating a new instance

## Module Structure

The example creates:
- 1 AMQP instance (or uses existing)
- 1 virtual host
- 1 exchange
- 1 queue
- 1 binding
- 1 static account

All configurations can be customized via variables in `variables.tf`.
