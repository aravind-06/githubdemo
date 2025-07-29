pipeline {
    agent any

    tools {
        maven 'maven3' // This must match the name you define in Jenkins Global Tools
        jdk 'jdk17'     // Define Java version (use name from Jenkins config)
    }

    environment {
        SONAR_TOKEN = credentials('sonar-token') // Jenkins credentials ID for Sonar token
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'jenkins-token', url: 'https://github.com/aravind-06/githubdemo.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('mysonar') {
                    sh 'mvn sonar:sonar -Dsonar.login=$SONAR_TOKEN'
                }
            }
        }
         stage('Docker Build') {
     		 steps {
       		 sh 'docker build -t githubdemo-app .'
      }
    }
   }
}