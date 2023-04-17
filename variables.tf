variable "name" {
  type    = string
  default = "front"
}
variable "geolocations" {
  type    = list(string)
  default = []
}
variable "dns" {
  type = string
}
variable "dns_zone" {
  type = string
}
variable "price_class" {
  type    = string
  default = "PriceClass_100"
}
variable "lambda_code" {
  type = string
}
variable "lambda_handler" {
  type    = string
  default = "index.handler"
}
variable "lambda_variables" {
  type    = map(string)
  default = {}
}
variable "tracing_mode" {
  type    = string
  default = null
}
variable "lambda_policy_statements" {
  type = list(object({
    actions   = list(string)
    resources = list(string)
    effect    = string
  }))
  default = []
}
variable "fake_origin" {
  type = string
  default = "unknown-origin.com"
}