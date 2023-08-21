pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'  // Defina a região da AWS aqui
    }

    stages {
        stage('Checkout') {
            steps {
                withCredentials([string(credentialsId: 'github-token-credential-id', variable: 'GITHUB_TOKEN')]) {
                    sh '''
                        git config --global user.email "giovana.sant@hotmail.com"
                        git config --global user.name "Giovana Assis"
                        git remote set-url origin git@github.com:giosassis/gFit-infra
                        git fetch --tags --force --progress origin +refs/heads/*:refs/remotes/origin/*
                        git checkout -f ${GIT_COMMIT}
                    '''
                }
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