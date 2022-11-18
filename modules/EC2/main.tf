resource "aws_instance" "terraform-demo-1" {
  ami                = var.ami-1
  instance_type      = var.instance_type-1
  key_name           = "ray-demo"

  # user_data          = <<-EOL
  # #!/bin/bash

  # dnf upgrade -y
  # dnf config-manager --set-enabled crb
  # dnf install epel-release epel-next-release -y
  # dnf install stress -y 
  # nohup stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 12h &
  # EOL

  user_data          = "${file("user-data-script.sh")}"

  tags               = {
    Name             = "terraform-demo-1"
    turbo_owner      = "Ray.Mileo@ibm.com"
    Terraform_Config = "https://github.com/turbonomic-integrations/terraform-demo/blob/main/terraform.tfvars::instance_type-1"
  }
}

# resource "aws_instance" "terraform-demo-2" {
#   ami                = var.ami-2
#   instance_type      = var.instance_type-2
#   key_name           = "ray-demo"
#   tags               = {
#     Name             = "terraform-demo-2"
#     turbo_owner      = "Ray.Mileo@ibm.com"
#     Terraform_Config = "https://github.com/turbonomic-integrations/terraform-demo/blob/main/terraform.tfvars::instance_type-2"
#   }
# }