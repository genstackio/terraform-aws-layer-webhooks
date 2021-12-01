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
variable "lambda_code" {
  type = string
}
variable "price_class" {
  type    = string
  default = "PriceClass_100"
}
variable "lambda_policy_statements" {
  type = list(object({
    actions = list(string)
    resources = list(string)
    effect = string
  }))
  default = []
}