provider "aws" {
  region = var.aws_region
}

resource "aws_msk_cluster" "msk_cluster" {
  cluster_name           = var.cluster_name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes

  broker_node_group_info {
    instance_type = var.broker_instance_type
    storage_info {
      ebs_storage_info {
        volume_size = var.ebs_volume_size
      }
    }

    client_subnets = var.subnet_ids
    security_groups = var.security_group_ids
    #security_groups = [aws_security_group.sg_msk.id]  # Référencement direct du groupe de sécurité
  }

  encryption_info {
    encryption_in_transit {
      client_broker = "TLS"
      in_cluster    = true
    }
  }

  configuration_info {
    arn      = aws_msk_configuration.msk_config.arn
    revision = aws_msk_configuration.msk_config.latest_revision
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled         = true
        log_group       = aws_cloudwatch_log_group.msk_log_group.name
      }
      firehose {
        enabled = false
      }
      s3 {
        enabled = false
      }
    }
  }

  tags = var.tags
}

resource "aws_msk_configuration" "msk_config" {
  name          = "${var.cluster_name}-configuration"
  kafka_versions = [var.kafka_version]
  server_properties = <<PROPERTIES
auto.create.topics.enable = true
delete.topic.enable = true
PROPERTIES
}

resource "aws_cloudwatch_log_group" "msk_log_group" {
  name = "/aws/msk/${var.cluster_name}"
  retention_in_days = 7
  tags = var.tags
}

