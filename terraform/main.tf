provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
}

resource "aws_security_group" "rds_security_group" {
  name_prefix = "rds-"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "backend_instance" {
  ami           = "ami-053b0d53c279acc90" # Substitua pela AMI correta do Ubuntu
  instance_type = "t2.micro"
  key_name      = "id_rsa_gfit"

  tags = {
    Name = "BackendInstance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y postgresql
              sudo apt-get install -y git
              sudo snap install dotnet-sdk --channel=7/stable --classic

              EOF

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa_gfit.pem") # Substitua pelo caminho da sua chave SSH privada
    host        = self.public_ip
  }
}

output "backend_public_ip" {
  value = aws_instance.backend_instance.public_ip
}

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
