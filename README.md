# Huawei Cloud Container Engine Node Pool

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | ~>1.47 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | ~>1.47 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [huaweicloud_cce_node_pool.main](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/cce_node_pool) | resource |
| [huaweicloud_availability_zones.zones](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Specifies the name of the available partition (AZ) | `string` | `null` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | Specifies the CCE cluster ID | `string` | n/a | yes |
| <a name="input_data_volume"></a> [data\_volume](#input\_data\_volume) | Specifies the configuration of the data disks:<br>  * `size`- Specifies the disk size in GB, data volume size must between 100 and 32768;<br>  * `volumetype` - Specifies the disk type;<br>  * `extend_params` - Specifies the disk expansion parameters. | <pre>object({<br>    size          = optional(number, 100)<br>    volumetype    = optional(string, "SAS")<br>    extend_params = optional(map(string))<br>  })</pre> | n/a | yes |
| <a name="input_ecs_group_id"></a> [ecs\_group\_id](#input\_ecs\_group\_id) | pecifies the ECS group ID, if specified, the node will be created under the cloud server group | `string` | `null` | no |
| <a name="input_extend_param"></a> [extend\_param](#input\_extend\_param) | Specifies the extended parameter. The available keys are as follows:<br><br>  * `agency_name`: The agency name to provide temporary credentials for CCE node to access other cloud services;<br>  * `alpha.cce/NodeImageID`: The custom image ID used to create the BMS nodes;<br>  * `dockerBaseSize`: The available disk space of a single docker container on the node in device mapper mode;<br>  * `DockerLVMConfigOverride`: Specifies the data disk configurations of Docker. | `map(string)` | `{}` | no |
| <a name="input_flavor_id"></a> [flavor\_id](#input\_flavor\_id) | Specifies the flavor ID | `string` | `"s6.xlarge.2"` | no |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | Specifies the initial number of expected nodes in the node pool | `number` | `2` | no |
| <a name="input_key_pair"></a> [key\_pair](#input\_key\_pair) | Specifies the key pair name when logging in to select the key pair mode | `string` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | Specifies the KMS key ID, this is used to encrypt the volume | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Specifies the tags of a Kubernetes node, key/value pair format | `map(string)` | `{}` | no |
| <a name="input_max_node_count"></a> [max\_node\_count](#input\_max\_node\_count) | Specifies the maximum number of nodes allowed, if auto scaling is enabled | `number` | `10` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | Specifies the maximum number of instances a node is allowed to create | `number` | `null` | no |
| <a name="input_min_node_count"></a> [min\_node\_count](#input\_min\_node\_count) | Specifies the minimum number of nodes allowed, if auto scaling is enabled | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the CCE node pool name | `string` | n/a | yes |
| <a name="input_name_postfix"></a> [name\_postfix](#input\_name\_postfix) | Specifies the CCE node pool name postfix | `string` | `null` | no |
| <a name="input_os"></a> [os](#input\_os) | Specifies the operating system of the node | `string` | `"EulerOS 2.9"` | no |
| <a name="input_pod_security_groups"></a> [pod\_security\_groups](#input\_pod\_security\_groups) | Specifies the list of security group IDs for the pod, only supported in CCE Turbo clusters | `list(string)` | `null` | no |
| <a name="input_postinstall"></a> [postinstall](#input\_postinstall) | Specifies the script to be executed after installation, the input value can be a Base64 encoded string or not | `string` | `null` | no |
| <a name="input_preinstall"></a> [preinstall](#input\_preinstall) | Specifies the script to be executed before installation, the input value can be a Base64 encoded string or not | `string` | `null` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Specifies the weight of the node pool, a node pool with a higher weight has a higher priority during scaling | `number` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Specifies the region in which to create the CCE node pool resource, if omitted, the provider-level region will be used | `string` | `null` | no |
| <a name="input_root_volume"></a> [root\_volume](#input\_root\_volume) | Specifies the configuration of the system disk:<br>  * `size`- Specifies the disk size in GB, root volume size must between 40 and 1024;<br>  * `volumetype` - Specifies the disk type;<br>  * `extend_params` - Specifies the disk expansion parameters. | <pre>object({<br>    size          = optional(number, 40)<br>    volumetype    = optional(string, "SAS")<br>    extend_params = optional(map(string))<br>  })</pre> | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Specifies the runtime of the CCE node pool | `string` | `"containerd"` | no |
| <a name="input_scale_down_cooldown_time"></a> [scale\_down\_cooldown\_time](#input\_scale\_down\_cooldown\_time) | Specifies the time interval between two scaling operations, in minutes | `number` | `null` | no |
| <a name="input_scall_enable"></a> [scall\_enable](#input\_scall\_enable) | Specifies whether to enable auto scaling. If Autoscaler is enabled, install the autoscaler add-on to use the<br>  auto scaling feature. | `bool` | `false` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | Specifies the list of custom security group IDs for the node pool | `list(string)` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Specifies the ID of the subnet to which the NIC belongs | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Specifies the key/value pairs to associate with the resources | `map(string)` | `{}` | no |
| <a name="input_taints"></a> [taints](#input\_taints) | Specifies the taints configuration of the nodes to set anti-affinity<br><br>  * `key` - A key must contain 1 to 63 characters starting with a letter or digit, only letters, digits, hyphens (-), underscores (\_), and periods (.) are allowed;<br>  * `value` - A value must start with a letter or digit and can contain a maximum of 63 characters, including letters, digits, hyphens (-), underscores (\_), and periods (.);<br>  * `effect` - Available options are NoSchedule, PreferNoSchedule, and NoExecute. | <pre>set(object({<br>    effect = string<br>    key    = string<br>    value  = string<br>  }))</pre> | `[]` | no |
| <a name="input_type"></a> [type](#input\_type) | Specifies the node pool type | `string` | `"vm"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_current_node_count"></a> [current\_node\_count](#output\_current\_node\_count) | The current number of the nodes |
| <a name="output_id"></a> [id](#output\_id) | The resource ID in UUID format |
| <a name="output_status"></a> [status](#output\_status) | Node status information |
<!-- END_TF_DOCS -->