pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile' // используем Dockerfile из репозитория
            label ''              // без указания агента
        }
    }

    stages {
        stage('Build JAR') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
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
                    sh 'docker run -d --name demo-app -p 8081:8080 jenkins-demo-app'
                }
            }
        }
    }
}
