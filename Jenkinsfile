pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/aravind-06/spring-sonar-jenkins-demo.git'
            }
        }

        stage('Build') {
            steps {
                sh './mvnw clean package'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('MyLocalSonar') {
                    sh './mvnw sonar:sonar'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t demo-app .'
            }
        }
    }
}
