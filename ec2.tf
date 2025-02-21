# Fetch the existing key pair
data "aws_key_pair" "deployee" {
  key_name = "deployee"
}

#Deploye the ec2 
resource "aws_instance" "comin-main_server" {
  instance_type          = "t2.micro"
  ami                    = "ami-00c257e12d6828491"
  key_name               = data.aws_key_pair.deployee.key_name # Reference the existing key pair
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.hr_system_sg.id]
  user_data              = file("userdata.tpl")

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "comin_main-server"
  }


}