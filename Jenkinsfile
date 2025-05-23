pipeline {
    agent any

    tools {
        maven 'Maven' // если нужен maven
        jdk 'JDK24'   // или другой, настроенный в Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('Run') {
            steps {
                sh 'java -jar target/*.jar &'
            }
        }
    }
}
