pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'  
    }
    tools {nodejs "node"}

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/giosassis/gfit-frontend', branch: 'main',
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
                withCredentials([
                    string(credentialsId: 'gfit-user', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'gfit-user', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    sh 'npm run deploy'
                }
            }
        }
    }   
}