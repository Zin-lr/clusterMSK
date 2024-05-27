
module "msk_cluster" {
  source = "./MSK"

  #aws_region          = "us-east-1"
  #cluster_name        = "my-msk-cluster"
  #kafka_version       = "2.8.0"
  #number_of_broker_nodes = 2
  #broker_instance_type = "kafka.m5.large"
  #ebs_volume_size     = 100
  subnet_ids          = ["subnet-040289f3533a4d4e2", "subnet-0864c77375bd4a6fa"] 
  security_group_ids  = ["sg-02066512d1dc6d15f"]
  tags                = {
    Environment = "dev"
    Project     = "msk-project"
  }
}
