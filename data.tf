data "aws_iam_policy_document" "appsync_athena_resolver" {
  statement {
    actions = [
      "athena:BatchGetQueryExecution",
      "athena:CancelQueryExecution",
      "athena:GetCatalogs",
      "athena:GetExecutionEngine",
      "athena:GetExecutionEngines",
      "athena:GetNamespace",
      "athena:GetNamespaces",
      "athena:GetQueryExecution",
      "athena:GetQueryExecutions",
      "athena:GetQueryResults",
      "athena:GetQueryResultsStream",
      "athena:GetTable",
      "athena:GetTables",
      "athena:ListQueryExecutions",
      "athena:RunQuery",
      "athena:StartQueryExecution",
      "athena:StopQueryExecution",
      "glue:GetTable",
      "glue:GetPartitions",
    ]

    resources = [
      "*",
    ]

    sid = "AllowAthenaAccess"
  }

  statement {
    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:ListMultipartUploadParts",
      "s3:PutObject",
    ]

    resources = [
      "${var.athena_s3_arn}/*",
      var.athena_s3_arn,
    ]

    sid = "ReadWriteResultFiles"
  }
}

data "aws_region" "current" {
}

