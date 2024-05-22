pipeline {
    agent any

    environment {
        // Configure AWS credentials and region
        AWS_ACCESS_KEY_ID     = credentials('your-aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('your-aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'us-east-2' // Change to your preferred AWS region
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

    post {
        always {
            // Clean up workspace
            //cleanWs()
        }
    }
}
