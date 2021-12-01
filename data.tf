data "archive_file" "lambda-code" {
  type        = "zip"
  output_path = "${path.module}/lambda-code.zip"
  source {
    content  = var.lambda_code
    filename = "index.js"
  }
}