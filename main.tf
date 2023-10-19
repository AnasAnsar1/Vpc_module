#VPC
resource "aws_vpc" "ec2_vpc" {
  cidr_block         = local.vpc_cidr
  instance_tenancy   = local.vpc_instance_tenancy
  enable_dns_support = local.enable_dns_support

  tags = {
    Name = var.vpc_info.tags
  }
}

#Public Subnet
resource "aws_subnet" "ec2_vpc_public_subnets" {
  count                   = local.public_subnet_count
  vpc_id                  = aws_vpc.ec2_vpc.id
  availability_zone       = local.public_subnet_az
  cidr_block              = local.public_subnet_cidr
  map_public_ip_on_launch = "true"

  tags = {
    Name = var.Public_Subnet_name[count.index]
  }
}

#Private Subnet
resource "aws_subnet" "ec2_vpc_private_subnets" {
  count                   = local.Private_subnet_count
  vpc_id                  = aws_vpc.ec2_vpc.id
  availability_zone       = local.private_subnet_az
  cidr_block              = local.private_subnet_cidr
  map_public_ip_on_launch = "false"

  tags = {
    Name = var.Private_Subnet_name[count.index]
  }
}


#Internet gateway
resource "aws_internet_gateway" "ec2_vpc_igway" {
  vpc_id = aws_vpc.ec2_vpc.id
  count = local.Igway_count

  tags = {
    Name = var.Internet_gateway_name[count.index]
  }

}

#Public Route table
resource "aws_route_table" "ec2_vpc_public_rt" {
  vpc_id = aws_vpc.ec2_vpc.id
  route {
    cidr_block = local.All
    gateway_id = aws_internet_gateway.ec2_vpc_igway[0].id
  }

  tags = {
    Name = var.Public_rt_name
  }
}

#Private Route table
resource "aws_route_table" "ec2_vpc_private_rt" {
  vpc_id = aws_vpc.ec2_vpc.id

  tags = {
    Name = var.Private_rt_name
  }
}

#Route table subnet association
#Public
resource "aws_route_table_association" "ec2_vpc_rt_public_association_1" {
  count          = local.Public_rts_count
  subnet_id      = aws_subnet.ec2_vpc_public_subnets[count.index].id
  route_table_id = aws_route_table.ec2_vpc_public_rt.id
}
#Private
resource "aws_route_table_association" "ec2_vpc_rt_private_association_1" {
  count          = local.Private_rts_count
  subnet_id      = aws_subnet.ec2_vpc_private_subnets[count.index].id
  route_table_id = aws_route_table.ec2_vpc_private_rt.id
}



