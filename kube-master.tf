resource "aws_instance" "kube-master" {
  ami           = "ami-0b44050b2d893d5f7"
  instance_type = "t2.medium"

  # the VPC subnet
  subnet_id = aws_subnet.kube-private-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.kubekey.key_name

  # user data
#  user_data = data.template_cloudinit_config.cloudinit-example.rendered
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "ap-south-1a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name  = "${aws_instance.kube-master.id}"
  volume_id    = aws_ebs_volume.ebs-volume-1.id
  instance_id  = aws_instance.kube-master.id
  skip_destroy = true                            # skip destroy to avoid issues with terraform destroy
}

resource "aws_instance" "kube-worker" {
  ami           = "ami-0b44050b2d893d5f7"
  instance_type = "t2.medium"

  # the VPC subnet
  subnet_id = aws_subnet.kube-private-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.kubekey.key_name

  # user data
#  user_data = data.template_cloudinit_config.cloudinit-example.rendered
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "ap-south-1a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}
