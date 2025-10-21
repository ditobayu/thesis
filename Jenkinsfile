pipeline {
    agent any
    
    environment {
        COMPOSE_PROJECT_NAME = 'skripsi'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'git@github.com:ditobayu/infodi-be.git', credentialsId: '2950525c-2149-48d8-b38d-f777a6989102'
            }
        }
        
        stage('Build & Deploy') {
            steps {
                script {
                    echo 'Stopping existing containers...'
                    sh 'docker-compose down || true'
                    
                    echo 'Starting containers...'
                    sh 'docker-compose up -d'
                    
                    echo 'Checking container status...'
                    sh 'docker-compose ps'
                }
            }
        }
        
        stage('Health Check') {
            steps {
                script {
                    echo 'Waiting for service to be ready...'
                    sleep(time: 5, unit: 'SECONDS')
                    
                    echo 'Checking if service is accessible...'
                    sh 'curl -f http://localhost:8080 || exit 1'
                }
            }
        }
    }
    
    post {
        success {
            echo 'Deployment successful! Access at http://localhost:8080'
        }
        failure {
            echo 'Deployment failed!'
            sh 'docker-compose logs'
        }
    }
}
