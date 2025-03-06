module "ec2" {
  source            = "./modules/ec2"
  ami_id           = "ami-12345678"
  instance_type    = "t2.micro"
  subnet_id        = "subnet-abc123"
  security_group_id = "sg-xyz123"
  instance_name    = "WebServer"
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-terraform-bucket-1234"
}

module "rds" {
  source            = "./modules/rds"
  db_username      = "admin"
  db_password      = "password123"
  multi_az         = true
  allocated_storage = 20
  instance_class    = "db.t3.micro"
}