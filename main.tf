
module "msk_cluster" {
  source = "./MSK"

  #aws_region          = "us-east-1"
  #cluster_name        = "my-msk-cluster"
  #kafka_version       = "2.8.0"
  #number_of_broker_nodes = 2
  #broker_instance_type = "kafka.m5.large"
  #ebs_volume_size     = 100
  subnet_ids          = ["subnet-02ab7a9f9db79e60c", "subnet-0c5ee1f15dc5435ca"] 
  security_group_ids  = ["sg-02066512d1dc6d15f"]
  tags                = {
    Environment = "dev"
    Project     = "msk-project"
  }
}
