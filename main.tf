# Redshift subnet group

data "aws_subnet_ids" "sub_id" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Private"
  }
}

resource "aws_redshift_subnet_group" "redshift_subnet_group" {
  name       = var.redshift_subnet_group
  subnet_ids = [aws_subnet.foo.id, aws_subnet.bar.id]

  tags = {
    environment = "Production"
  }
}

# Redshift parameter group

resource "aws_redshift_parameter_group" "bar" {
  name   = "parameter-group-test-terraform"
  family = "redshift-1.0"

  parameter {
    name  = "require_ssl"
    value = "true"
  }

  parameter {
    name  = "query_group"
    value = "example"
  }

  parameter {
    name  = "enable_user_activity_logging"
    value = "true"
  }
}

resource "aws_redshift_cluster" "default" {
  cluster_identifier = var.identifier
  cluster_version = var.version
  number_of_nodes    = var.node_count
  node_type          = var.node_type
  cluster_type       = var.node_count > 1 ? "multi-node" : "single-node"
  master_username    = var.master_user
  master_password    = var.master_pass
  
  # IAM Roles
  iam_roles = var.cluster_iam_roles
  
  
  allow_version_upgrade = var.version_upgrade
  vpc_security_group_ids = var.vpc_security_group_ids
  
  #cluster_subnet_group_name    = local.redshift_subnet_group_name
  #cluster_parameter_group_name = local.parameter_group_name
  availability_zone = var.az
  enhanced_vpc_routing = var.enhanced_vpc_route
  publicly_accessible = var.public_Access
  database_name      = var.db_name
  port = var.db_port
  
  # Encryption
  encrypted  = var.encrypted
  kms_key_id = var.kms_key_id 
  
  # Logging
  logging {
    enable        = var.enable_logging
    bucket_name   = var.logging_bucket_name
    s3_key_prefix = var.logging_s3_key_prefix
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [master_password]
  }
}



