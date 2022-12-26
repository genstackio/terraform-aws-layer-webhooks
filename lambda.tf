module "lambda" {
  source            = "genstackio/lambda/aws"
  version           = "0.3.0"
  name              = var.name
  file              = data.archive_file.lambda-code.output_path
  runtime           = "nodejs14.x"
  timeout           = 30
  memory_size       = 128
  handler           = var.lambda_handler
  publish           = true
  tracing_mode      = var.tracing_mode
  assume_role_identifiers = ["edgelambda.amazonaws.com"]
  policy_statements = var.tracing_mode == "Active" ? concat(var.lambda_policy_statements,[
     {
      actions   = ["xray:PutTraceSegments"]
      resources = ["*"]
      effect    = "Allow"
    },
    {
      actions   = ["xray:PutTelemetryRecords"]
      resources = ["*"]
      effect    = "Allow"
    }
  ]) : var.lambda_policy_statements
  providers = {
    aws = aws.central
  }
}