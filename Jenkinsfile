pipeline {
    agent any

    stages {
        stage('Checkout Repo') {
            steps {
                git 'https://github.com/sunny8421/mygitcode.git'
            }
        }

        stage('Read File') {
            steps {
                echo 'Reading automation.txt'
                bat 'type automation.txt'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t gradle-test:1.0 .'
            }
        }

        stage('Run Tests on Kubernetes') {
            steps {
                bat 'kubectl delete pod gradle-test-pod --ignore-not-found'
                bat 'kubectl apply -f pod.yaml'
                bat 'kubectl wait --for=condition=Ready pod/gradle-test-pod --timeout=300s'
                bat 'kubectl logs gradle-test-pod'
            }
        }
    }
}
