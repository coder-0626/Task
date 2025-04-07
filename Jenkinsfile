pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', 
                url: 'https://github.com/coder-0626/Task.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("static-web:${env.BUILD_ID}")
                }
            }
        }
        
        stage('Run Container') {
            steps {
                script {
                    // Stop and remove any existing container
                    sh 'docker stop static-web-container || true'
                    sh 'docker rm static-web-container || true'
                    
                    // Run new container
                    dockerImage.run("--name static-web-container -p 80:80 -d")
                }
            }
        }
    }
    
    post {
        always {
            echo 'Cleaning up...'
            // Clean up unused docker images
            sh 'docker system prune -f'
        }
    }
}
