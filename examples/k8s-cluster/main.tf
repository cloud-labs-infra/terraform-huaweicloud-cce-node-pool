provider "huaweicloud" {
  region = "ap-southeast-3"
}


module "vpc" {
  source  = "cloud-labs-infra/vpc/huaweicloud"
  version = "1.0.0"

  name = "dev01"
}


module "keypair" {
  source  = "cloud-labs-infra/keypair/huaweicloud"
  version = "1.0.0"

  name       = "dev01"
  public_key = "ssh-rsa ....."
}


module "k8s_cluster" {
  source  = "cloud-labs-infra/cce-cluster/huaweicloud"
  version = "1.0.2"

  name       = "dev01"
  flavor_id  = "cce.s1.small"
  vpc_id     = module.vpc.vpc_id
  subnet_id  = module.vpc.public_subnets_ids[0]
  delete_all = "true"
}


module "k8s_node_pool" {
  source  = "cloud-labs-infra/cce-node-pool/huaweicloud"
  version = "1.0.1"

  name         = "dev01"
  name_postfix = "01"

  cluster_id         = module.k8s_cluster.id
  subnet_id          = module.vpc.public_subnets_ids[0]
  key_pair           = module.keypair.name
  flavor_id          = "s6.xlarge.2"
  initial_node_count = 1


  root_volume = {
    volumetype = "SSD"
    size       = 40
  }

  data_volume = {
    volumetype = "SSD"
    size       = 100
  }
}
