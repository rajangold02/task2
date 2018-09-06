variable "region" {}
variable "az_count"{
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
 default = "30.0.0.0/16"
}
variable "destinationcidrblock" {
        default = "0.0.0.0/0"
}
variable "mappublicip" {
        default = true
}
