#Terraform Remote State Backend usingonly using S3
# I am not going to use DynmoreDB becouse there are no mulitiple devolper 

terraform{
    backend "s3" {
        bucket = "comin-tf-state-bucket"
        key = "terraform/statefile"
        region = "us-west-2"
        encrypt = true
      
    }
}


