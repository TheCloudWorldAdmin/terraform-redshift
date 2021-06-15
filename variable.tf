variable "cluster_identifier" {
  type = "string"
  default = ""
}

variable "db_name" {
  type = "string"
default = "mydb"
}

variable "master_user" {
  type = "string"
default = ""
}

variable "master_pass" {
  type = "string"
  default = ""
}

variable "node_type" {
  type = "string"
  default = "dc2.large"
}

variable "clustertype" {
  type = "string"
  default = "single-node"
}
