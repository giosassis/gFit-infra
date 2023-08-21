pipeline {
    agent any

    parameters {
        string(name: 'AWS_ACCESS_KEY_ID', defaultValue: '', description: 'AWS Access Key ID')
        string(name: 'AWS_SECRET_ACCESS_KEY', defaultValue: '', description: 'AWS Secret Access Key')
        string(name: 'EC2_SSH_KEY', defaultValue: '', description: 'Path to EC2 SSH key')
        string(name: 'EC2_IP', defaultValue: '', description: 'IP Address of EC2 instance')
    }

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/seu-usuario/seu-repositorio-frontend.git', branch:'main'
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Deploy to S3') {
            steps {
                sh 'npm run deploy'
            }
        }
    }
}
