resource "aws_security_group" "hr_system_sg" {
  name        = "comin-SG"
  description = "Security group for ComIn HR System"
  vpc_id      = aws_vpc.main.id  

  # Allow SSH from your IP only 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  
  }

  # Allow HTTP from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow custom TCP ports 8081-8085 from anywhere
  ingress {
    from_port   = 8081
    to_port     = 8085
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic, the instance can connect to the internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ComIn-SG"
  }
}
