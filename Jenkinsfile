pipeline {

    agent any

    environment {
        IMAGE_NAME = "resume-build"
        CONTAINER_NAME = "resume-build-container"
    }

    stages {

        stage('Clean Workspace') {
            steps {
                deleteDir()
            }
        }

        stage('Clone Repository') {
            steps {
                git branch: 'main',
                url: 'https://github.com/KeerthanaAR123/ResumeBuilder.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Remove Old Container') {
            steps {
                bat 'docker rm -f %CONTAINER_NAME% || exit 0'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker run -d --name %CONTAINER_NAME% -p 8085:8080 %IMAGE_NAME%'
            }
        }
    }

    post {

        success {

            emailext(
                to: 'kk9741463496@gmail.com',
                subject: 'Resume Builder Build Successful',
                body: '''
Hello,

Your Resume Builder project was built and deployed successfully using Jenkins.

Application URL:
http://localhost:8085/resume-builder

Regards,
Jenkins CI/CD Pipeline
'''
            )
        }

        failure {

            emailext(
                to: 'kk9741463496@gmail.com',
                subject: 'Resume Builder Build Failed',
                body: '''
Hello,

The Jenkins pipeline failed while building or deploying the Resume Builder project.

Please check Jenkins Console Output for details.

Regards,
Jenkins CI/CD Pipeline
'''
            )
        }
    }
}
