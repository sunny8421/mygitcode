pipeline {
    agent any

    stages {

        stage('Checkout Repo') {
            steps {
                git 'https://github.com/sunny8421/mygitcode.git'
            }
        }

        stage('Build Image in Minikube') {
            steps {
                bat '''
                minikube status
                @FOR /f "tokens=*" %%i IN ('minikube docker-env --shell cmd') DO @%%i
                docker info | findstr Name
                docker build -t gradle-test:1.0 .
                '''
            }
        }

        stage('Run Tests on Kubernetes') {
            steps {
                bat '''
                kubectl delete pod gradle-test-pod --ignore-not-found
                kubectl apply -f pod.yaml
                kubectl wait --for=condition=Succeeded pod/gradle-test-pod --timeout=300s
                kubectl logs gradle-test-pod
                '''
            }
        }
    }
}
