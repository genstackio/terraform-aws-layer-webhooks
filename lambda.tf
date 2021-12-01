module "lambda" {
  source            = "genstackio/lambda/aws"
  version           = "0.1.12"
  name              = var.name
  file              = data.archive_file.lambda-code.output_path
  runtime           = "nodejs14.x"
  timeout           = 30
  memory_size       = 128
  handler           = "index.handler"
  publish           = true
  assume_role_identifiers = ["edgelambda.amazonaws.com"]
  policy_statements = var.lambda_policy_statements
  providers = {
    aws = aws.central
  }
}