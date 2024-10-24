pipeline {
    agent any

    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/KhaledGs5/Test.git', credentialsId: 'git-cred'
            }
        }

        stage('Sonarqube Analysis') {
            steps {
                sh """
                ${SCANNER_HOME}/bin/sonar-scanner \
                -Dsonar.host.url=http://20.64.226.92:9000 \
                -Dsonar.login=squ_05dc2fcafbc8abc4870094ea690acd6962787829 \
                -Dsonar.projectName=Test \
                -Dsonar.java.binaries=. \
                -Dsonar.projectKey=Test \
                -X
                """
            }
        }

        stage('Docker Build and Push') {
            steps {
                script {
                    docker.withDockerRegistry([credentialsId: "docker-cred", url: "https://index.docker.io/v1/"]) {
                        sh "docker build -t khaledgs/Test ."
                        sh "docker push khaledgs/Test"
                    }
                }
            }
        }
    }
}
