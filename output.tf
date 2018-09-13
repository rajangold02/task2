output "vcp_id" {
  value = "${aws_vpc.my_vpc.id}"
}

output "subnet_public_id" {
  value = "${aws_subnet.my_public_subnet.*.id}"
}

output "subnet_private_id" {
  value = "${aws_subnet.my_private_subnet.*.id}"
}
