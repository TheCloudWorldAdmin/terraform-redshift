resource "aws_redshift_cluster" "default" {
  cluster_identifier = var.identifier
  cluster_version = var.version
  node_type          = var.node_count > 1 ? "dc2.large" : "ra3.4xlarge"
  number_of_nodes    = var.node_count
  cluster_type       = var.node_count > 1 ? "multi-node" : "single-node"
  database_name      = var.db_name
  master_username    = var.master_user
  master_password    = var.master_pass
  allow_version_upgrade = var.version_upgrade
  
  
  
  
  port = var.db_port
}

