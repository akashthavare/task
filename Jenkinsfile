pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY_CREDENTIALS = credentials('your-docker-credentials-id')  // Replace with your Docker credentials ID
        KUBECONFIG = credentials('your-kubeconfig-credentials-id')  // Replace with your Kubernetes config credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run Tests') {
            steps {
                
                   sh 'npm install'
                   sh 'npm test'
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', DOCKER_REGISTRY_CREDENTIALS) {
                        def customImage = docker.build('your-docker-username/your-image-name:latest', '.')
                        customImage.push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                  
                    withKubeConfig(credentialsId: 'kubeconfig-credentials-id', serverUrl: 'kube-server-url') {
                        
                           sh 'kubectl apply -f path/to/your/kubernetes/manifests'
                    }
                }
            }
        }
    }
}
