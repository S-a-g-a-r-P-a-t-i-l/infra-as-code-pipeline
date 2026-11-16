variable "name"               { type = string }
variable "region"             { type = string }
variable "vpc_id"             { type = string }
variable "public_subnet_ids"  { type = list(string) }
variable "ecs_subnet_ids"     { type = list(string) }
variable "alb_sg_id"          { type = string }
variable "ecs_sg_id"          { type = string }
variable "execution_role_arn" { type = string }
variable "task_role_arn"      { type = string }
variable "log_group_name"     { type = string }
variable "assign_public_ip"   { type = bool }
variable "container_port" {
  type    = number
  default = 8080
}
variable "cpu" {
  type    = number
  default = 256
}
variable "memory" {
  type    = number
  default = 512
}
variable "min_tasks" {
  type    = number
  default = 2
}
variable "max_tasks" {
  type    = number
  default = 6
}
variable "image_tag" {
  type    = string
  default = "latest"
}
