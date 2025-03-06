resource "aws_db_instance" "db" {
  allocated_storage    = var.allocated_storage
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = var.instance_class
  multi_az            = var.multi_az
  username            = var.db_username
  password            = var.db_password
  publicly_accessible = false
  skip_final_snapshot = true
}