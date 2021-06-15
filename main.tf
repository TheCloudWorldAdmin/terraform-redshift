resource "aws_iam_role" "iam_for_redshift" {
  name = "redshift_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "redshift.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "redshift_s3" {
  name        = "redshift_s3"
  path        = "/"
  description = "IAM policy for s3 access for redshift"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "redshift_s3" {
  role      = aws_iam_role.iam_for_redshift.name
  policy_arn = aws_iam_policy.redshift_s3.arn
}

resource "aws_redshift_cluster" "redshift" {
  cluster_identifier = var.cluster_identifier
  database_name      = var.db_name
  master_username    = var.master_user
  master_password    = var.master_pass
  node_type          = var.node_type
  cluster_type       = var.clustertype
  iam_roles = [aws_iam_role.iam_for_redshift.arn]
}
