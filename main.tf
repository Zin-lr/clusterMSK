
module "msk_cluster" {
  source = "./MSK"

  #aws_region          = "us-east-1"
  cluster_name        = "mansa-msk-cluster-interns"
  #kafka_version       = "2.8.0"
  #number_of_broker_nodes = 2
  #broker_instance_type = "kafka.m5.large"
  #ebs_volume_size     = 100
  subnet_ids          = ["subnet-0b36c6c08b5baf9c2", "subnet-0c56e5bc834623aed"] 
  security_group_ids  = ["sg-03da91baf42537dae"]
  tags                = {
    Environment = "dev1"
    Project     = "mansa-msk-project1"
  }
}
