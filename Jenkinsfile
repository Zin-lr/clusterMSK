pipeline {
    agent any

    environment {
        // Configure AWS credentials and region
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'eu-central-1' // Change to your preferred AWS region
    }

    stages {
        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Plan Terraform deployment
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply Terraform changes
                sh 'terraform apply -auto-approve'
            }
        }
    }

  
}
