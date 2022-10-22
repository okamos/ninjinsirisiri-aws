module "ubuntu" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.name}-ubuntu"

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.small"
  key_name               = local.name
  monitoring             = true
  vpc_security_group_ids = [module.sg.security_group_id]
  subnet_id              = data.terraform_remote_state.common.outputs.vpc.private_subnets[0]

  tags = merge(local.tags, {
    Name : "${local.name}-ubuntu",
  })
}

module "centos" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.name}-centos"

  ami                    = data.aws_ami.centos.id
  instance_type          = "t3.small"
  key_name               = local.name
  monitoring             = true
  vpc_security_group_ids = [module.sg.security_group_id]
  subnet_id              = data.terraform_remote_state.common.outputs.vpc.private_subnets[0]

  tags = merge(local.tags, {
    Name : "${local.name}-centos",
  })
}

module "redhat" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.name}-redhat"

  ami                    = data.aws_ami.redhat.id
  instance_type          = "t3.small"
  key_name               = local.name
  monitoring             = true
  vpc_security_group_ids = [module.sg.security_group_id]
  subnet_id              = data.terraform_remote_state.common.outputs.vpc.private_subnets[0]

  tags = merge(local.tags, {
    Name : "${local.name}-redhat",
  })
}
