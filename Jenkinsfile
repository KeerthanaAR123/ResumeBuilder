pipeline {
    agent any
    environment {
        EMAIL_RECIPIENT = 'user@example.com'
        PROJECT_NAME = 'Resume Builder'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'mvn -B clean package'
                    } else {
                        bat 'mvn -B clean package'
                    }
                }
            }
        }
        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker build -t resume-builder:latest .'
                    } else {
                        bat 'docker build -t resume-builder:latest .'
                    }
                }
            }
        }
    }
    post {
        success {
            mail to: env.EMAIL_RECIPIENT,
                 subject: "${env.PROJECT_NAME} Build #${env.BUILD_NUMBER} Success",
                 body: "Build ${env.BUILD_NUMBER} completed successfully.\n\nJob: ${env.JOB_NAME}\nURL: ${env.BUILD_URL}"
        }
        failure {
            mail to: env.EMAIL_RECIPIENT,
                 subject: "${env.PROJECT_NAME} Build #${env.BUILD_NUMBER} Failed",
                 body: "Build ${env.BUILD_NUMBER} failed. Please review the Jenkins log at ${env.BUILD_URL}."
        }
    }
}
