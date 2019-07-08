variable "api_id" {
  description = "The API ID for the GraphQL API for the DataSource."
  type        = string
}

variable "athena_s3_arn" {
  description = "S3 bucket arn that Athena will store the query results in"
  type        = string
}

variable "athena_s3_staging_dir" {
  description = "This is the S3 location that Athena will store the query results in. It must be in the format s3://YOUR_S3_BUCKET/path/to/."
  type        = string
}

variable "athena_schema_name" {
  default     = "default"
  description = "The schema/database name that you wish to query. If not provided, will default to the default schema/database."
  type        = string
}

variable "athena_datasource_policy_arn" {
  description = "The arn of the iam policy that needs to be attached to the resolver lambda. This policy must be having read permissions to underlying datasource, which can be s3/dynamo etc and also access to KMS key used to decrypt the datasource"
  type        = string
}

variable "aws_athena_region_name" {
  default     = ""
  description = "The AWS region for Athena that this function should use. Defaults to the region that the function is executing in."
  type        = string
}

variable "dead_letter_arn" {
  description = "The arn for the SNS topic that handles dead letters"
  type        = string
}

variable "kms_key_arn" {
  description = "The arn of the KMS key used to encrypt the environment variables"
  type        = string
}

variable "max_concurrent_queries" {
  default     = "5"
  description = "The maximum number of concurrent queries to run in Athena. Defaults to 5."
  type        = number
}

variable "name_prefix" {
  default     = ""
  description = "The prefix to place on all created resources"
  type        = string
}

variable "poll_interval" {
  default     = "1.0"
  description = "The rate at which to poll Athena for a response, in seconds. Defaults to 1.0."
  type        = number
}

