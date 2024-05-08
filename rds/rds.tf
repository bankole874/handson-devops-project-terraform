#RDS file

#create a security group for RDS Database Instance
resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#create a RDS Parameter Group
resource "aws_db_parameter_group" "my_db_parameter_group" {
  name        = "my-instance-mysql-5-7"
  family      = "mysql5.7"
  description = "My MySQL 5.7 Parameter Group"
}

#create a RDS Database Instance
resource "aws_db_instance" "myinstance" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "wordpressDB"
  password             = "BaN#M$56789"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  parameter_group_name = aws_db_parameter_group.my_db_parameter_group.name
  skip_final_snapshot  = true
}

#outputs.tf
output "security_group_id" {
  value       = aws_security_group.rds_sg.id
}
output "db_instance_endpoint" {
  value       = aws_db_instance.myinstance.endpoint
}
