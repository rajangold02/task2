variable "access_key" {}
variable "secret_key" {}
variable "region" {}

variable "az_count" {
  default = "2"
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
  default = "10.0.0.0/16"
}

variable "destinationcidrblock" {
  default = "0.0.0.0/0"
}

variable "mappublicip" {
  default = true
}
