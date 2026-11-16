variable "region" {
  type    = string
  default = "ap-south-1"
}
variable "project" {
  type    = string
  default = "capstone3"
}
variable "vpc_cidr" { type = string }
variable "enable_nat" { type = bool }
variable "cpu" { type = number }
variable "memory" { type = number }
variable "min_tasks" { type = number }
variable "max_tasks" { type = number }
