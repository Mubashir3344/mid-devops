pipeline {
    agent any

    stages {
        stage('Fetch Data') {
            steps {
                echo 'Fetching latest data from GitHub...'
                sh 'git pull origin main'
            }
        }

        stage('Train Model') {
            steps {
                echo 'Training the model...'
                sh 'python3 train.py'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t ml-api .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Starting Docker container...'
                sh 'docker stop ml-api-container || true'
                sh 'docker rm ml-api-container || true'
                sh 'docker run -d -p 8000:8000 --name ml-api-container ml-api'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed! API running at port 8000.'
        }
        failure {
            echo 'Pipeline failed. Check logs above.'
        }
    }
}
