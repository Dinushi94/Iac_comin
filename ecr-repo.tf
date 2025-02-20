resource "aws_ecr_repository" "comin_leave_management" {
  name = "comin-leave-management-service"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "comin-leave-management-service"
    Environment = "production"
  }
}
