output "msk_cluster_arn" {
  description = "The ARN of the MSK cluster."
  value       = aws_msk_cluster.msk_cluster.arn
}

output "msk_cluster_name" {
  description = "The name of the MSK cluster."
  value       = aws_msk_cluster.msk_cluster.cluster_name
}

output "msk_cluster_zookeeper_connect_string" {
  description = "The Zookeeper connect string for the MSK cluster."
  value       = aws_msk_cluster.msk_cluster.zookeeper_connect_string
}

output "msk_cluster_bootstrap_brokers" {
  description = "The bootstrap brokers for the MSK cluster."
  value       = aws_msk_cluster.msk_cluster.bootstrap_brokers
}

output "msk_cluster_bootstrap_brokers_tls" {
  description = "The bootstrap brokers for the MSK cluster (TLS)."
  value       = aws_msk_cluster.msk_cluster.bootstrap_brokers_tls
}
