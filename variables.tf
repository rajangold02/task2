variable "region" {
 default = "us-east-1"
}
variable "availabilityZone" {
        default = "us-east-1a"
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
variable "vpccirdblock" {
 default = "30.0.0.0/16"
}
variable "subnetcidrlock" {
        default = "30.0.1.0/24"
}
variable "destinationcidrblock" {
        default = "0.0.0.0/0"
}
variable "mappublicip" {
        default = true
}