resource "aws_db_instance" "mysql" {
  identifier           = "s7rosine_db"
  allocated_storage    = 10
  db_name              = "mysqldb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "mysql31071971"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}