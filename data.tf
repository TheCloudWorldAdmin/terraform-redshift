# Fetching Subnet details where cluster needs to be launched
data "aws_vpc" "vpc" {
filter {
name = "tag:Name"
values = [var.vpc_name]
}
}
data "aws_subnet_ids" "sub_name" {
  vpc_id = data.aws_vpc.vpc.id
filter   {                                                       
    name = "tag:Name"
   values = [var.subnet_name]
  }   
}

data "aws_subnet" "subnet_list" {
 for_each = data.aws_subnet_ids.sub_name.ids
 id       = each.value
}



  data "aws_security_group" "sg" {
   vpc_id = data.aws_vpc.vpc.id
   filter   {                                                       
    name = "tag:Name"
   values = [var.security_group_name]
  }   
}
