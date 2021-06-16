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

variable "allow_version_upgrade" {
  description = "major version upgrades can be applied during the maintenance window to the Amazon Redshift engine that is running on the cluster, if it is true"
  type        = bool
  default     = false
}

