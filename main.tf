resource "aws_security_group" "sg_msk" {
  name   = MSK/var.security_group_name
  vpc_id = MSK/var.vpcID

  ingress {
    from_port   = 9092
    to_port     = 9092
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
module "msk_cluster" {
  source = "./MSK"

  #aws_region          = "us-east-1"
  #cluster_name        = "my-msk-cluster"
  #kafka_version       = "2.8.0"
  #number_of_broker_nodes = 2
  #broker_instance_type = "kafka.m5.large"
  #ebs_volume_size     = 100
  subnet_ids          = ["subnet-040289f3533a4d4e2", "subnet-0864c77375bd4a6fa"] 
  security_group_ids  = [aws_security_group.sg_msk.id]
  tags                = {
    Environment = "dev1"
    Project     = "msk-project1"
  }
}
