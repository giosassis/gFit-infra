pipeline {
    agent any

    parameters {
        string(name: 'AWS_ACCESS_KEY_ID', defaultValue: '', description: 'AWS Access Key ID')
        string(name: 'AWS_SECRET_ACCESS_KEY', defaultValue: '', description: 'AWS Secret Access Key')
    }

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id-credential-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key-credential-id')
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
