provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Project     = var.project
      Environment = terraform.workspace
      ManagedBy   = "terraform"
    }
  }
}

locals {
  name = "${var.project}-${terraform.workspace}"
}

module "networking" {
  source     = "./modules/networking"
  name       = local.name
  cidr       = var.vpc_cidr
  enable_nat = var.enable_nat
}

module "security" {
  source = "./modules/security"
  name   = local.name
  vpc_id = module.networking.vpc_id
}

module "monitoring" {
  source       = "./modules/monitoring"
  name         = local.name
  cluster_name = "${local.name}-cluster"
  service_name = "${local.name}-svc"
}

module "compute" {
  source             = "./modules/compute"
  name               = local.name
  region             = var.region
  vpc_id             = module.networking.vpc_id
  public_subnet_ids  = module.networking.public_subnet_ids
  ecs_subnet_ids     = module.networking.ecs_subnet_ids
  alb_sg_id          = module.security.alb_sg_id
  ecs_sg_id          = module.security.ecs_sg_id
  execution_role_arn = module.security.execution_role_arn
  task_role_arn      = module.security.task_role_arn
  log_group_name     = module.monitoring.log_group_name
  assign_public_ip   = !var.enable_nat
  cpu                = var.cpu
  memory             = var.memory
  min_tasks          = var.min_tasks
  max_tasks          = var.max_tasks
}
