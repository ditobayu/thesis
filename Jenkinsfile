pipeline {
    agent any
    
    // Define a custom Docker Compose project name
    environment {
        COMPOSE_PROJECT_NAME = 'skripsi'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ditobayu/thesis.git'
            }
        }
        
        stage('Build & Deploy') {
            steps {
                script {
                    echo 'Stopping existing containers...'
                    sh 'docker compose down || true'
                    
                    echo 'Starting containers...'
                    sh 'docker compose up -d'
                    
                    echo 'Checking container status...'
                    sh 'docker compose ps'
                }
            }
        }
        
        stage('Health Check') {
            steps {
                script {
                    echo 'Waiting for service to be ready...'
                    sleep(time: 5, unit: 'SECONDS')
                    
                    echo 'Checking if service is accessible...'
                    sh 'curl -f http://localhost:8083 || exit 1'
                }
            }
        }
    }
    
    post {
        success {
            echo 'Deployment successful! Access at http://localhost:8083'
        }
        failure {
            echo 'Deployment failed!'
            sh 'docker-compose logs'
        }
    }
}
