## Vpc Module Usage.

```HCL
module "less_vpc" {
  
  source = "git::https://github.com/AnasAnsar1/Vpc_module.git"

  region = "ap-south-1"

  vpc_info = {
    cidr_block         = "10.0.0.0/16"
    tags               = "terra_ec2_vpc"
    instance_tenancy   = "default"
    enable_dns_support = "true"
  }

  Public_Subnet_name    = ["terra_ec2_Public_subnet_1"]

  Private_Subnet_name   = ["terra_ec2_Private_subnet_1"]

  Internet_gateway_name = ["terra_ec2_vpc_igway"]

  Public_rt_name        = "Public_rt"

  Private_rt_name       = "Private_rt"

}
```

# Outputs

### VPC

**vpc_id** == ID of the vpc.

**vpc_cidr_block** == Cidr block of vpc.

**main_route_table_id** == ID of the main route table associated vpc.

**vpc_name** == Name of vpc.

---

### Public Subnet
**public_subnet_count** == Count of subnets.

**public_subent_az** == Availability zone of subnets.

**public_subent_cidr_block** == Cidr block of public subnet.

**public_subnet_names** == Names of public subnets.

---

### Private Subnet
**private_subnet_count** == Count of subnets.

**private_subent_az** == Availability zone of subnets.

**private_subent_cidr_block** == Cidr block of private subnet.

**private_subnet_names** == Names of private subnets.

---

### Internet gateway
**internet_gateway_name** == Name of Internet gateway.

**internet Gateway_id** == ID of Internet gateway.

---

### Public route table
***Public_rt_id** == ID of public route table.

---

### Private route table
***Private_rt_id** == ID of private route table.
