data "huaweicloud_availability_zones" "zones" {
  region = var.region
}

locals {
  name = var.name_postfix == null ? format("%s-node-pool", var.name) : format("%s-node-pool-%s", var.name, var.name_postfix)
}

resource "huaweicloud_cce_node_pool" "main" {
  name                     = local.name
  cluster_id               = var.cluster_id
  region                   = var.region
  initial_node_count       = var.initial_node_count
  flavor_id                = var.flavor_id
  type                     = var.type
  availability_zone        = var.availability_zone == null ? element(data.huaweicloud_availability_zones.zones.names, 0) : var.availability_zone
  os                       = var.os
  key_pair                 = var.key_pair
  password                 = null
  subnet_id                = var.subnet_id
  max_pods                 = var.max_pods
  ecs_group_id             = var.ecs_group_id
  preinstall               = var.preinstall
  postinstall              = var.postinstall
  extend_param             = var.extend_param
  scall_enable             = var.scall_enable
  min_node_count           = var.scall_enable ? var.min_node_count : null
  max_node_count           = var.scall_enable ? var.min_node_count : null
  scale_down_cooldown_time = var.scall_enable ? var.scale_down_cooldown_time : null
  priority                 = var.scall_enable ? var.priority : null
  security_groups          = var.security_groups
  pod_security_groups      = var.pod_security_groups
  labels                   = var.labels
  runtime                  = var.runtime

  dynamic "taints" {
    for_each = var.taints
    content {
      effect = taints.value.effect
      key    = taints.value.key
      value  = taints.value.value
    }
  }

  root_volume {
    size          = var.root_volume.size
    volumetype    = var.root_volume.volumetype
    extend_params = var.root_volume.extend_params
    kms_key_id    = var.kms_key_id
  }

  data_volumes {
    size          = var.data_volume.size
    volumetype    = var.data_volume.volumetype
    extend_params = var.data_volume.extend_params
    kms_key_id    = var.kms_key_id
  }

  tags = var.tags
}
