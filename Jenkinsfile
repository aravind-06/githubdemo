pipeline {
    agent any

    tools {
        maven 'Maven 3' // This must match the name you define in Jenkins Global Tools
        jdk 'jdk17'     // Define Java version (use name from Jenkins config)
    }

    environment {
        SONAR_TOKEN = credentials('sonar-token') // Jenkins credentials ID for Sonar token
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/aravind-06/gitgubdemo.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('MySonar') {
                    sh 'mvn sonar:sonar -Dsonar.login=$SONAR_TOKEN'
                }
            }
        }
    }
}