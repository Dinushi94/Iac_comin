resource "aws_s3_bucket" "tfsatebuckt" {
  bucket = "comin-tf-state-bucket"

  tags = {
    Name = "Comin tf"
  }

  lifecycle {
    prevent_destroy = true
  }
}


# create the s3 bucket to store terraform state file