provider "aws" {
  region = "us-east-2"
  shared_credentials_files = ["creds"]
}

resource "aws_instance" "terraform-demo-1" {
  ami           = "ami-0b6c5068ffed9440f"
  instance_type = var.instance_type-1
  tags = {
    Name = "terraform-demo-1"
    turbo_owner = "Ray.Mileo@ibm.com"
    Terraform_Config = "https://github.com/turbonomic-integrations/terraform-demo.git:variable"
  }
}