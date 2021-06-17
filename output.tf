output "cluster_arn" {
  value = aws_redshift_cluster.redshift_cluser.arn
}

output "cluster_id" {
  value = aws_redshift_cluster.redshift_cluster.id
}

output "cluster_identifier" {
  value = aws_redshift_cluster.redshift_cluster.cluster_identifier
}

output "cluster_type" {
  value = aws_redshift_cluster.redshift_cluser.cluster_type
}

output "cluster_node_type" {
  value = aws_redshift_cluster.redshift_cluster.node_type
}

output "cluster_database_name" {
  value = aws_redshift_cluster.redshift_cluster.database_name
}

output "cluster_availability_zone" {
  value = aws_redshift_cluster.redshift_cluser.availability_zone
}

output "cluster_automated_snapshot_retention_period" {
  value = aws_redshift_cluster.redshift_cluster.automated_snapshot_retention_period
}

output "cluster_preferred_maintenance_window" {
  value = aws_redshift_cluster.redshift_cluster.preferred_maintenance_window
}

output "cluster_endpoint" {
  value = aws_redshift_cluster.redshift_cluster.endpoint
}

output "cluster_encrypted" {
  value = aws_redshift_cluster.redshift_cluster.encrypted
}

output "cluster_security_groups" {
  value = aws_redshift_cluster.redshift_cluser.cluster_security_groups
}

output "cluster_vpc_security_group_ids" {
  value = aws_redshift_cluster.redshift_cluster.vpc_security_group_ids
}

output "cluster_dns_name" {
  value = aws_redshift_cluster.redshift_cluster.dns_name
}

output "cluster_port" {
  value = aws_redshift_cluster.redshift_cluster.port
}

output "cluster_version" {
  value = aws_redshift_cluster.redshift_cluster.cluster_version
}

#output "cluster_parameter_group_name" {
#  value = aws_redshift_cluster.redshift_cluster.cluster_parameter_group_name
#}

output "cluster_subnet_group_name" {
  value = aws_redshift_cluster.redshift_cluster.cluster_subnet_group_name
}

output "cluster_public_key" {
  value = aws_redshift_cluster.redshift_cluser.cluster_public_key
}

output "cluster_revision_number" {
  value = aws_redshift_cluster.redshift_cluster.cluster_revision_number
}

output "cluster_tags_all" {
  value = aws_redshift_cluster.redshift_cluster.tags_all
}
# Subnet IDs will be shown as output

output "subnet_ids" {
  value = [for sub in data.aws_subnet.subnet_list : sub.id]
}
