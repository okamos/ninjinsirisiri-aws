module "bastion" {
  source = "Guimove/bastion/aws"

  bucket_name           = "${local.name}-bastion"
  region                = "ap-northeast-1"
  vpc_id                = data.terraform_remote_state.common.outputs.vpc.vpc_id
  is_lb_private         = false
  bastion_host_key_pair = "ninjinsirisiri"

  create_dns_record   = true
  hosted_zone_id      = "Z29TMATHKFJV0D"
  bastion_record_name = "bastion.ninjinsirisiri.sre.oisix.com"

  bastion_iam_policy_name = "${local.name}BastionPolicy"
  bastion_iam_role_name   = "${local.name}BastionRole"

  elb_subnets                = data.terraform_remote_state.common.outputs.vpc.public_subnets
  auto_scaling_group_subnets = data.terraform_remote_state.common.outputs.vpc.private_subnets

  tags = merge(local.tags, {
    Name : local.name,
  })
}
