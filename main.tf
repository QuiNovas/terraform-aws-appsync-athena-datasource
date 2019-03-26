module "appsync_athena_resolver" {
  environment_variables {
    AWS_ATHENA_S3_STAGING_DIR = "${var.athena_s3_staging_dir}"
    AWS_ATHENA_SCHEMA_NAME    = "${var.athena_schema_name}"
    MAX_CONCURRENT_QUERIES    = "${var.max_concurrent_queries}"
    POLL_INTERVAL             = "${var.poll_interval}"
  }

  dead_letter_arn = "${var.dead_letter_arn}"
  handler         = "function.handler"
  kms_key_arn     = "${var.kms_key_arn}"
  l3_object_key   = "quinovas/appsync-athena-resolver/appsync-athena-resolver-0.0.2.zip"
  name            = "${var.name_prefix}-appsync-athena-resolver"

  policy_arns = [
    "${aws_iam_policy.appsync_athena_resolver.arn}",
    "${var.datalake_policy_arn}",
  ]

  policy_arns_count = 2
  runtime           = "python3.7"
  source            = "QuiNovas/lambdalambdalambda/aws"
  timeout           = 30
  version           = "0.2.0"
}

resource "aws_iam_policy" "appsync_athena_resolver" {
  name   = "${var.name_prefix}-appsync-athena-resolver"
  policy = "${data.aws_iam_policy_document.appsync_athena_resolver.json}"
}

resource "random_string" "random_string" {
  length = 6
  special = false
}

module "appsync_lambda_datasource" {
  api_id                   = "${var.api_id}"
  invoke_lambda_policy_arn = "${module.appsync_athena_resolver.invoke_policy_arn}"
  lambda_function_arn      = "${module.appsync_athena_resolver.arn}"
  name                     = "Athena_${random_string.random_string.result}"
  source                   = "QuiNovas/appsync-lambda-datasource/aws"
  version                  = "1.0.1"
}
