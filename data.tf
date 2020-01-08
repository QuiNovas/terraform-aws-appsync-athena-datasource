data "aws_iam_policy_document" "non_default_staging_dir_access" {
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
      "${var.athenaathena_s3_staging_arn_s3_arn}/*",
      var.athena_s3_staging_arn,
    ]

    sid = "ReadWriteResultFiles"
  }
}

data "aws_region" "current" {
}

