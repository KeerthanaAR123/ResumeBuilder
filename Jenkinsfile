pipeline {

    agent any

    tools {
        maven 'Maven'
        jdk 'JDK21'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/KeerthanaAR123/Maven-Demo.git'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }
    }

    post {

    success {

        emailext(
            to: 'kk9741463496@gmail.com',

            subject: 'Resume Builder Application Running Successfully',

            body: '''
Hello,

Your Resume Builder application has been deployed successfully.

Application URL:
http://localhost:8080

Regards,
Jenkins CI/CD Pipeline
'''
        )
    }

    failure {

        emailext(
            to: 'kk9741463496@gmail.com',

            subject: 'Build Failed',

            body: '''
Build failed.

Please check Jenkins console output.
'''
        )
    }
}
}
