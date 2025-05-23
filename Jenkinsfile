pipeline {
    agent any

    tools {
        maven 'Maven' // Название Maven в Jenkins (см. ниже)
        jdk 'JDK24'   // Название JDK в Jenkins
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/fenrir-create/ForTK_rost'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    def imageName = 'jenkins-demo-app'
                    sh "docker build -t ${imageName} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker rm -f demo-app || true'
                    sh 'docker run -d --name demo-app -p 8080:8080 jenkins-demo-app'
                }
            }
        }
    }
}
