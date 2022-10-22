module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${local.name}-hosts"
  description = "Security group for ${local.name} with ssh ports"
  vpc_id      = data.terraform_remote_state.common.outputs.vpc.vpc_id

  ingress_cidr_blocks = [data.terraform_remote_state.common.outputs.vpc.vpc_cidr_block]
  ingress_rules       = ["ssh-tcp"]

  egress_with_cidr_blocks = [
    {
      rule        = "http-80-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      rule        = "https-443-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
