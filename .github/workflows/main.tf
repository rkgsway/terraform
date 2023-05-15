resource "aws_instance" "webservers" {
	count = "${length(var.subnets_cidr)}" 
	ami = "${var.webservers_ami}"
	instance_type = "${var.instance_type}"
	security_groups = ["${aws_security_group.webservers.id}"]
	subnet_id = "${element(aws_subnet.public.*.id,count.index)}"
}

resource "aws_s3_bucket" "gouthambucket" {
  bucket = "my-personal-goutham-test-bucket"

  tags = {
    Name        = "Goutham bucket"
    Environment = "Dev"
  }
}
