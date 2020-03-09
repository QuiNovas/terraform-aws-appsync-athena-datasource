data "aws_iam_policy_document" "non_default_staging_dir_access" {
  count = var.athena_s3_staging_arn == "" ? 0 : 1
  statement {
    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:ListMultipartUploadParts",
      "s3:PutObject",
      "s3:GetBucketLocation",
    ]

    resources = [
      "${var.athena_s3_staging_arn}/*",
      var.athena_s3_staging_arn,
    ]

    sid = "ReadWriteResultFiles"
  }
}

data "aws_region" "current" {
}