resource "aws_db_subnet_group" "mysql-subnet" {
 name = "mysql-subnet"
 description = "RDS subnet group"
 subnet_ids = ["${aws_subnet.kube-private-1.id}","${aws_subnet.kube-private-2.id}"]
}
resource "aws_db_parameter_group" "mysql-parameters" {
 name = "mysql-parameter"
 family = "mysql.8.0.16"
 description = "Mysql DB parameter"

 parameter {
    name = "max_allowed_packet"
    value = "16777216"
 }
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "root"
  password             = "${var.RDS_PASSWORD}"
  db_subnet_group_name = "${aws_db_subnet_group.mysql-subnet.name}"
  parameter_group_name = "mysql-parameters"
  multi_az             = "true"
  vpc_security_group_ids = ["${aws_security_group.allow-mysqldb.id}"]
  backup_retention_period = 30
  availability_zone    = "${aws_subnet.kube-private-1.availability_zone}" #preferred zone

  tags = {
      Name = "mysqldb-instance"
}
}
