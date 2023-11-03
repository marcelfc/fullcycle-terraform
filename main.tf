module "new-vpc" {
    source = "./modules/vpc"
    prefix = var.prefix
    vpc_cidr_block = var.vpc_cidr_block
}

module "eks" {
    source = "./modules/eks"
    prefix = var.prefix
    vpc_id = module.new-vpc.vpc_id
    max_size =var.max_size
    min_size =var.min_size
    desired_size =var.desired_size
    cluster_name =var.cluster_name
    retention_days =var.retention_days
    subnet_ids = module.new-vpc.subnet_ids
}