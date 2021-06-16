# Redshift subnet group

data "aws_subnet_ids" "sub_name" {
  vpc_id = var.vpc_id
filter   {                                                       
    name = "tag:Name"
   values = ["redshift"]
  }   
}

data "aws_subnet" "subnet_list" {
 for_each = data.aws_subnet_ids.sub_name.ids
 id       = each.value
}

output "subnet_ids" {
  value = [for sub in data.aws_subnet.subnet_list : sub.id]
}

#data "aws_subnet_ids" "sub_name" {                              
 # vpc_id = var.vpc_id                            
  #filter   {                                                       
   # name = "tag:Name"
   #values = ["redshift"]
  #}                                                                   
#} 

resource "aws_redshift_subnet_group" "redshift_subnet_group" {
  name       = var.redshift_subnet_group
  subnet_ids = [for sub in data.aws_subnet.subnet_list : sub.id]

  tags = {
    environment = "test"
  }
}

# Redshift parameter group

resource "aws_redshift_cluster" "default" {
  cluster_identifier = var.identifier
  cluster_version = var.version_detail
  number_of_nodes    = var.node_count
  node_type          = var.node_type
  cluster_type       = var.node_count > 1 ? "multi-node" : "single-node"
  master_username    = var.master_user
  master_password    = var.master_pass
  
  # IAM Roles
  iam_roles = [var.cluster_iam_roles]
  
  
  allow_version_upgrade = var.version_upgrade
  vpc_security_group_ids = [var.vpc_security_group_ids]
  
  #cluster_subnet_group_name    = local.redshift_subnet_group_name
  #cluster_parameter_group_name = local.parameter_group_name
  availability_zone = var.az
  enhanced_vpc_routing = var.enhanced_vpc_route
  publicly_accessible = var.public_Access
  database_name      = var.db_name
  port = var.db_port
  
  # Snapshots and backups
  final_snapshot_identifier           = var.final_snapshot_identifier
  skip_final_snapshot                 = var.skip_final_snapshot
  automated_snapshot_retention_period = var.automated_snapshot_retention_period
  preferred_maintenance_window        = var.preferred_maintenance_window
 

  # Snapshots copy to another region
  dynamic "snapshot_copy" {
    for_each = compact([var.snapshot_copy_destination_region])
    content {
      destination_region = var.snapshot_copy_destination_region
      retention_period   = var.automated_snapshot_retention_period
    }
  }
  # Encryption
  encrypted  = var.encrypted
  #kms_key_id = var.kms_key_id
  
  # Logging
 # logging {
 #   enable        = var.enable_logging
 #   bucket_name   = var.logging_bucket_name
 #   s3_key_prefix = var.logging_s3_key_prefix
 # }

  tags = var.tags

  lifecycle {
    ignore_changes = [master_password]
  }
}



