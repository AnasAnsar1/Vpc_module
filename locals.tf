locals {

  #VPC
  vpc_cidr             = var.vpc_info.cidr_block
  vpc_instance_tenancy = var.vpc_info.instance_tenancy
  instance_tenancy     = "default"
  enable_dns_support   = "true"


  #Public Subnet
  public_subnet_count = length(var.Public_Subnet_info)
  public_subnet_az    = format("%sa", var.region)
  public_subnet_cidr  = cidrsubnet(aws_vpc.ec2_vpc.cidr_block, 8, 1)


  #Private Subnet
  Private_subnet_count = length(var.Private_Subnet_info)
  private_subnet_az    = format("%sa", var.region)
  private_subnet_cidr  = cidrsubnet(aws_vpc.ec2_vpc.cidr_block, 8, 2)


  #Public Route table
  All = "0.0.0.0/0"


  #Public Route table subnet association
  Public_rts_count = length(var.Public_Subnet_info)


  #Private Route table subnet association
  Private_rts_count = length(var.Private_Subnet_info)

  #Internet gway
  Igway_count = length(var.Internet_gateway_info)
  
}
