resource "aws_instance" "ec2" {
  ami                    = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t3.micro"
  root_block_device {
    volume_size = 50 # Increase from 20 → 50
    volume_type = "gp3"
  }
  user_data = file("docker.sh")

  tags = {
    Name = "Docker VM"
  }


}


resource "aws_security_group" "allow_tls" {
  name        = "Security_group"
  description = " it allows all the traffic in and all teh traffic out"

  ingress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }
  tags = {
    Name = "docker_vm_sg"
  }

}

output "docker_ec2_info" {
  value = aws_instance.ec2.public_ip
}