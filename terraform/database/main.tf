resource "aws_db_instance" "database_instance" {
  allocated_storage   = 20
  storage_type        = "gp2"
  engine              = "postgres"
  engine_version      = "14.8"
  instance_class      = "db.t3.micro"
  db_name             = "postgres"
  username            = "postgres"
  password            = var.db_password
  publicly_accessible = true
  skip_final_snapshot = true
}

output "endpoint" {
  value = aws_db_instance.database_instance.endpoint
}