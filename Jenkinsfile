pipeline {
        agent any

        environment {
            AWS_DEFAULT_REGION = 'us-east-1'  
        }
        tools {nodejs "node"}

        stages {
            stages {
                stage('Checkout') {
                    steps {
                        script {
                            def credentialsId = 'token-credential-id'  
                            def credentials = credentials(credentialsId)
                            sh '''
                                git config --global user.email "giovana.sant@hotmail.com"
                                git config --global user.name "Giovana Assis"
                                git remote set-url origin https://github.com/giosassis/gfit-frontend
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
                        string(credentialsId: 'gfit-user', variable: 'AWS_SECRET_ACCESS_KEY')
                    ]) {
                        sh 'npm run deploy'
                    }
                }
            }
        }   
    }
}