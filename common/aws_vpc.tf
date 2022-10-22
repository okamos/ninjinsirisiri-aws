module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.base
  cidr = "10.19.0.0/16"

  azs             = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  private_subnets = ["10.19.1.0/24", "10.19.2.0/24", "10.19.3.0/24"]
  public_subnets  = ["10.19.17.0/24", "10.19.18.0/24", "10.19.19.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = local.tags
}

output "vpc" {
  value = module.vpc
}
