variable "region" {
  type = string
}

variable "vpc_info" {
  type = object({
    cidr_block         = string
    tags               = string
    instance_tenancy   = string
    enable_dns_support = bool
  })

  default = {
    cidr_block         = "192.168.0.0/16"
    instance_tenancy   = "default"
    enable_dns_support = "true"
    tags               = "terra_ec2_vpc"
  }
}

variable "Public_Subnet_name" {
  type = list(string)

  default = ["Public_subnet_1"]
}

variable "Private_Subnet_name" {
  type = list(string)

  default = ["Private_subnet_1"]
}

variable "Internet_gateway_name" {
  type = list(string)

  default = ["ec2_vpc_igway"]
}

#Public Route table
variable "Public_rt_name" {
  type = string

  default = "ec2_vpc_public_rt"

}

#Private Route table
variable "Private_rt_name" {
  type = string

  default = "ec2_vpc_private_rt"

}

