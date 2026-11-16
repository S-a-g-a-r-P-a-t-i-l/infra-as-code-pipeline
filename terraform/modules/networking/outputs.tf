output "vpc_id" { value = aws_vpc.this.id }
output "public_subnet_ids" { value = aws_subnet.public[*].id }
output "private_subnet_ids" { value = aws_subnet.private[*].id }
# Dev/staging: tasks in public subnets (no NAT, cheap). Prod: private subnets + NAT.
output "ecs_subnet_ids" {
  value = var.enable_nat ? aws_subnet.private[*].id : aws_subnet.public[*].id
}
