resource "aws_instance" "backend_instance" {
  ami           = "ami-053b0d53c279acc90"
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

              # ... (outros comandos)
              EOF

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa_gfit.pem")
    host        = self.public_ip
  }
}

output "public_ip" {
  value = aws_instance.backend_instance.public_ip
}
