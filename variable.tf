variable "redshift_cluster_tag" {
  description = "Tag for redshift"
  type = string
  default = ""
}
variable "security_group_name" {
  description = "Security group details with the mentioned name should be fetched"
  type = string
  default = ""
}

#variable "external_id" {
#  description = "Authentication Key"
#  type = string
#}

#variable "role_arn" {
#  description = "Role ARN"
#  type = string
#}

variable "env_name" {
  description = "Environment Name to be given"
  type = string
  default = ""
}

variable "final_snapshot_identifier" {
  description = "(Optional) The identifier of the final snapshot that is to be created immediately before deleting the cluster. If this parameter is provided, 'skip_final_snapshot' must be false."
  type        = string
  default     = "final_snapshot"
}

variable "skip_final_snapshot" {
  description = "If true (default), no snapshot will be made before deleting DB"
  type        = bool
  default     = false
}

variable "preferred_maintenance_window" {
  description = "When AWS can run snapshot, can't overlap with maintenance window"
  type        = string
  default     = "sat:10:00-sat:10:30"
}

variable "automated_snapshot_retention_period" {
  description = "How long will we retain backups"
  type        = number
  default     = 5
}

variable "snapshot_copy_destination_region" {
  description = "(Optional) The name of the region where the snapshot will be copied."
  type        = string
  default     = "us-east-2"
}


variable "db_name" {
  description = "Database name for Redshift should be given"
  type = string
  default = ""
}

variable "region_name" {
  type = string
  default = ""
}

variable "vpc_name" {
  description = "VPC name needs to be given manually"
  type = string
  default = ""
}

variable "subnet_name" {
  description = "Tag name needs to be given, where we need to launch the cluster"
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
variable "version_detail" {
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
  type        = string
  default     = ""
}

variable "node_type" {
  description = "List of instance types"
  type = string
  default = "dc2.large"
}

variable "public_Access" {
  description = "Allow instances and devices outside the VPC to connect to your database through the cluster endpoint."
  type = bool
  default = false
}

variable "db_port" {
  description = "Database port on which DB listens"
  type        = number
  default     = 5439
}

variable "vpc_security_group_ids" {
  description = "List of security groups can be associated with the cluster."
  type        = string
  default = ""
}

variable "az" {
  description = "Availability zone where cluster needs to be launched"
  type = string
  default = ""
}

variable "version_upgrade" {
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
