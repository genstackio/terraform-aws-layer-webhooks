output "dns" {
  value = var.dns
}
output "cloudfront_id" {
  value = aws_cloudfront_distribution.cdn.id
}
output "lambda_arn" {
  value = module.lambda.arn
}
output "lambda_name" {
  value = module.lambda.name
}
output "lambda_role_name" {
  value = module.lambda.role_name
}
output "lambda_role_arn" {
  value = module.lambda.role_arn
}