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
  assume_role_identifiers = ["edgelambda.amazonaws.com"]
  policy_statements = concat(var.lambda_policy_statements,[
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
  ])
  providers = {
    aws = aws.central
  }
}