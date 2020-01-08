output "datasource_arn" {
  description = "The ARN of the created datasource."
  value       = module.appsync_lambda_datasource.arn
}

output "datasource_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the datasource's role. "
  value       = module.appsync_lambda_datasource.role_arn
}

output "datasource_role_id" {
  description = "The id of the datasource's role."
  value       = module.appsync_lambda_datasource.role_id
}

output "datasource_role_name" {
  description = "The name of the datasource's role."
  value       = module.appsync_lambda_datasource.role_name
}

output "datasource_role_unique_id" {
  description = "The stable and unique string identifying the datasource's role."
  value       = module.appsync_lambda_datasource.role_unique_id
}

output "lambda_arn" {
  description = "The arn of athena resolver Lambda function"
  value       = module.appsync_athena_resolver.arn
}

output "lambda_invoke_arn" {
  description = "The invocation arn of this athena resolver Lambda function"
  value       = module.appsync_athena_resolver.invoke_arn
}

output "lambda_invoke_policy_arn" {
  description = "The arn of the invocation policy athena resolver Lambda function"
  value       = module.appsync_athena_resolver.invoke_policy_arn
}

output "lambda_name" {
  description = "The name of this resolver Lambda function"
  value       = module.appsync_athena_resolver.name
}

output "lambda_qualified_arn" {
  description = "The qualified arn of this Lambda function"
  value       = module.appsync_athena_resolver.qualified_arn
}

output "lambda_qualified_invoke_arn" {
  description = "The qualified invocation arn of the Lambda function"
  value       = module.appsync_athena_resolver.qualified_invoke_arn
}

