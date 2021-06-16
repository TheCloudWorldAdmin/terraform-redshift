variable "region_name" {
  type = string
  default = ""
}

variable "vpc_id" {
  description = "VPC ID needs to be given manually"
  type = string
  default = ""
}

variable "subnet_name" {
  description = "Subnet name needs to be given, where we need to launch the cluster"
  type = string
  default = ""
}

variable "redshift_subnet_group" {
  description = "Name of the subnet group"
  type = string
  default = ""
}

variable "identifier" {
  description = "Identifier Name"
  type = string
  default = ""
}
variable "version" {
  description = "Only 1.0 is available as of now"
  type = string
  default = "1.0"
}
variable "node_count" {
  description = "Number of nodes needs to be launched"
  type = number
  default = 1
}
variable "master_user" {
  description = "Admin Username"
  type = string
  default = ""
}

variable "master_pass" {
  description = "Admin Password"
  type = string
  default = ""
}

variable "cluster_iam_roles" {
  description = "A list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time."
  type        = list(string)
  default     = []
}

variable "node_type" {
  description = "List of instance types"
  type = list(string)
  default = ["ra3.4xlarge", "dc2.large"]
}

variable "public_Access" {
  description = "Allow instances and devices outside the VPC to connect to your database through the cluster endpoint."
  type = string
  default = "disable"
}

variable "db_port" {
  description = "Database port on which DB listens"
  type        = number
  default     = 5439
}

variable "vpc_security_group_ids" {
  description = "List of security groups can be associated with the cluster."
  type        = list(string)
}

variable "az" {
  description = "Availability zone where cluster needs to be launched"
  type = string
  default = ""
}

variable "allow_version_upgrade" {
  description = "major version upgrades can be applied during the maintenance window to the Amazon Redshift engine that is running on the cluster, if it is true"
  type        = bool
  default     = false
}

variable "enhanced_vpc_route" {
  description = "If true, enhanced VPC routing is enabled."
  type        = bool
  default     = false
}

variable "encrypted" {
  description = "If true , the data in the cluster is encrypted at rest."
  type        = bool
  default     = false
}
