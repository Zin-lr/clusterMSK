avariable "aws_region" {
  description = "region to use for AWS resources"
  type        = string
  default     = "eu-central-1"
}
variable "broker_instance_type" {
  description = "The instance type for the broker nodes."
  type        = string
  default     = "kafka.m7g.large"
}
variable "cluster_name" {
  description = "name for msk cluster"
  type = string
  default = "mansa-msk-clutser"
}
variable "kafka_version" {
  type = string
  default = "3.4.0"
}
variable "number_of_broker_nodes" {
  type = number
  default = 1
}
variable "ebs_volume_size" {
  description = "The size in GiB of the EBS volume for the broker nodes."
  type        = number
  default     = 100
}
variable "subnet_ids" {
  description = "A list of subnet IDs for the broker nodes."
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.3.0/24",
  ]
}
variable "security_group_ids" {
  description = "A list of security group IDs for the broker nodes."
  type        = list(string)
}
variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "private_cidr_blocks" {
  type = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
  ]
}
variable "vpcID" {
  type = string
  default = "vpc-0a3570bf43997e60f"
}
variable "security_group_name" {
  type = string
  default = "mansa-Msk-security-group"
}
