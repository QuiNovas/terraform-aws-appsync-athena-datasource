locals {
  aws_athena_region_name = var.aws_athena_region_name == "" ? data.aws_region.current.name : var.aws_athena_region_name
}

