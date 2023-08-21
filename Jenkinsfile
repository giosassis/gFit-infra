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
        stage('Install Dependencies') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }
    }
}
