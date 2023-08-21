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
                git 'https://github.com/giosassis/gFit-backend', branch 'main'
            }
        }
        stage('Build') {
            steps {
                sh 'dotnet restore'
                sh 'dotnet build'
            }
        }
        stage('Deploy to EC2') {
            steps {
                sh 'dotnet publish -c Release -o ./publish'
                sh 'scp -i ~/.ssh/id_rsa_gfit.pem -r ./publish ubuntu@ec2-3-91-118-149:/home/ubuntu/backend'
            }
        }
    }
}
