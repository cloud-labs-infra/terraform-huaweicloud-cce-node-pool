variable "name" {
  description = "Specifies the CCE node pool name"
  type        = string
  nullable    = false
}

variable "name_postfix" {
  description = "Specifies the CCE node pool name postfix"
  type        = string
  default     = null
}

variable "region" {
  description = "Specifies the region in which to create the CCE node pool resource, if omitted, the provider-level region will be used"
  type        = string
  default     = null
}

variable "cluster_id" {
  description = "Specifies the CCE cluster ID"
  type        = string
  nullable    = false
}

variable "initial_node_count" {
  description = "Specifies the initial number of expected nodes in the node pool"
  type        = number
  default     = 2
}

variable "flavor_id" {
  description = "Specifies the flavor ID"
  type        = string
  default     = "s6.xlarge.2"
}

variable "type" {
  description = "Specifies the node pool type"
  type        = string
  default     = "vm"
  validation {
    condition     = contains(["vm", "ElasticBMS"], var.type)
    error_message = "Possible values are: 'vm' and 'ElasticBMS'."
  }
}

variable "availability_zone" {
  description = "Specifies the name of the available partition (AZ)"
  type        = string
  default     = null
}

variable "os" {
  description = "Specifies the operating system of the node"
  type        = string
  default     = "EulerOS 2.9"
}

variable "key_pair" {
  description = "Specifies the key pair name when logging in to select the key pair mode"
  type        = string
  nullable    = false
}

variable "subnet_id" {
  description = "Specifies the ID of the subnet to which the NIC belongs"
  type        = string
  nullable    = false
}

variable "max_pods" {
  description = "Specifies the maximum number of instances a node is allowed to create"
  type        = number
  default     = null
}

variable "ecs_group_id" {
  description = "pecifies the ECS group ID, if specified, the node will be created under the cloud server group"
  type        = string
  default     = null
}

variable "preinstall" {
  description = "Specifies the script to be executed before installation, the input value can be a Base64 encoded string or not"
  type        = string
  default     = null
}

variable "postinstall" {
  description = "Specifies the script to be executed after installation, the input value can be a Base64 encoded string or not"
  type        = string
  default     = null
}

variable "extend_param" {
  description = <<DES
  Specifies the extended parameter. The available keys are as follows:

  * `agency_name`: The agency name to provide temporary credentials for CCE node to access other cloud services;
  * `alpha.cce/NodeImageID`: The custom image ID used to create the BMS nodes;
  * `dockerBaseSize`: The available disk space of a single docker container on the node in device mapper mode;
  * `DockerLVMConfigOverride`: Specifies the data disk configurations of Docker.
  DES
  type        = map(string)
  default     = {}
}

variable "scall_enable" {
  description = <<DES
  Specifies whether to enable auto scaling. If Autoscaler is enabled, install the autoscaler add-on to use the
  auto scaling feature.
  DES
  type        = bool
  default     = false
}

variable "min_node_count" {
  description = "Specifies the minimum number of nodes allowed, if auto scaling is enabled"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Specifies the maximum number of nodes allowed, if auto scaling is enabled"
  type        = number
  default     = 10
}

variable "scale_down_cooldown_time" {
  description = "Specifies the time interval between two scaling operations, in minutes"
  type        = number
  default     = null
}

variable "priority" {
  description = "Specifies the weight of the node pool, a node pool with a higher weight has a higher priority during scaling"
  type        = number
  default     = null
}

variable "security_groups" {
  description = "Specifies the list of custom security group IDs for the node pool"
  type        = list(string)
  default     = null
}

variable "pod_security_groups" {
  description = "Specifies the list of security group IDs for the pod, only supported in CCE Turbo clusters"
  type        = list(string)
  default     = null
}

variable "labels" {
  description = "Specifies the tags of a Kubernetes node, key/value pair format"
  type        = map(string)
  default     = {}
}

variable "runtime" {
  description = "Specifies the runtime of the CCE node pool"
  type        = string
  default     = "containerd"
  validation {
    condition     = contains(["docker", "containerd"], var.runtime)
    error_message = "Possible values are: 'docker' and 'containerd'."
  }
}

variable "taints" {
  description = <<DES
  Specifies the taints configuration of the nodes to set anti-affinity

  * `key` - A key must contain 1 to 63 characters starting with a letter or digit, only letters, digits, hyphens (-), underscores (_), and periods (.) are allowed;
  * `value` - A value must start with a letter or digit and can contain a maximum of 63 characters, including letters, digits, hyphens (-), underscores (_), and periods (.);
  * `effect` - Available options are NoSchedule, PreferNoSchedule, and NoExecute.
  DES
  type = set(object({
    effect = string
    key    = string
    value  = string
  }))
  default = []
}

variable "root_volume" {
  description = <<DES
  Specifies the configuration of the system disk:
  * `size`- Specifies the disk size in GB, root volume size must between 40 and 1024;
  * `volumetype` - Specifies the disk type;
  * `extend_params` - Specifies the disk expansion parameters.
  DES
  type = object({
    size          = optional(number, 40)
    volumetype    = optional(string, "SAS")
    extend_params = optional(map(string))
  })
}

variable "data_volume" {
  description = <<DES
  Specifies the configuration of the data disks:
  * `size`- Specifies the disk size in GB, data volume size must between 100 and 32768;
  * `volumetype` - Specifies the disk type;
  * `extend_params` - Specifies the disk expansion parameters.
  DES
  type = object({
    size          = optional(number, 100)
    volumetype    = optional(string, "SAS")
    extend_params = optional(map(string))
  })
}

variable "kms_key_id" {
  description = "Specifies the KMS key ID, this is used to encrypt the volume"
  type        = string
  default     = null
}

variable "tags" {
  description = "Specifies the key/value pairs to associate with the resources"
  type        = map(string)
  default     = {}
}
