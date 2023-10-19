#Vpc
output "vpc_id" {
  value = aws_vpc.ec2_vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.ec2_vpc.cidr_block
}

output "main_route_table_id" {
  value = aws_vpc.ec2_vpc.main_route_table_id
}

output "vpc_name" {
  value = aws_vpc.ec2_vpc.tags
}



#Public Subnet
output "public_subnet_count" {
  value = aws_subnet.ec2_vpc_public_subnets.count
}

output "public_subent_az" {
  value = aws_subnet.ec2_vpc_public_subnets.availability_zone
}

output "public_subent_cidr_block" {
  value = aws_subnet.ec2_vpc_public_subnets.cidr_block
}

output "public_subnet_names" {
  value = aws_subnet.ec2_vpc_public_subnets.tags.Name[count.index]
}



#Private Subnet
output "private_subnet_count" {
  value = aws_subnet.ec2_vpc_private_subnets.count
}

output "private_subent_az" {
  value = aws_subnet.ec2_vpc_private_subnets.availability_zone
}

output "private_subent_cidr_block" {
  value = aws_subnet.ec2_vpc_private_subnets.cidr_block
}

output "private_subnet_names" {
  value = aws_subnet.ec2_vpc_private_subnets.tags.Name[count.index]
}



#Internet gateway
output "internet_gateway_name" {
  value = aws_internet_gateway.ec2_vpc_igway.tags
}
output "internet Gateway_id" {
  value = aws_internet_gateway.ec2_vpc_igway.id
}



#Public route table
output "Public_rt_id" {
  value = aws_route_table.ec2_vpc_public_rt.id
}



#Private route table
output "Private_rt_id" {
  value = aws_route_table.ec2_vpc_private_rt.id
}

