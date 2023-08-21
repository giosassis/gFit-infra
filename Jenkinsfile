pipeline {
    agent any
    
    tools {nodejs "node"}

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', 
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[url: 'https://github.com/giosassis/gfit-frontend']]
                ])
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
                    string(credentialsId: 'gfit-user', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    sh 'npm run deploy'
                }
            }
        }
    }
}
