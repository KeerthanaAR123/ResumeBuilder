pipeline {

    agent any

    stages {

        stage('Build Maven') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t resume-build .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker rm -f resume-build-container || exit 0'
                bat 'docker run -d --name resume-build-container -p 8085:8080 resume-build'
            }
        }
    }

    post {

        success {
            emailext(
                to: 'kk9741463496@gmail.com',
                subject: 'Resume Builder Build Successful',
                body: 'Resume Builder deployed successfully.'
            )
        }

        failure {
            emailext(
                to: 'kk9741463496@gmail.com',
                subject: 'Resume Builder Build Failed',
                body: 'Pipeline failed.'
            )
        }
    }
}
