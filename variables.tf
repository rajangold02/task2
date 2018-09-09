variable "access_key" {}
variable "secret_key" {}
variable "region" {}

variable "az_count" {
  default = "1"
}

variable "instanceTenancy" {
  default = "default"
}

variable "dnssupport" {
  default = true
}

variable "dnshostnames" {
  default = true
}

variable "vpccidrblock" {
  default = "${env.vpc}"
}

variable "destinationcidrblock" {
  default = "0.0.0.0/0"
}

variable "mappublicip" {
  default = true
}
