variable "access" {
 type = string
 description = "AWS access ID"
}
variable "secret" {
 type = string
 description = "AWS secret"
}
variable "instance_type-1" {
 type = string
 default = "t2.micro"
 description = "EC2 instance type"
}
variable "instance_type-2" {
 type = string
 default = "t2.micro"
 description = "EC2 instance type"
}