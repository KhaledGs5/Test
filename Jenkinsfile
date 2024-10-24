pipeline {
    agent any

    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'git branch: 'main', credentialsId: 'git-cred', url: 'https://github.com/KhaledGs5/Test.git'
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
        stage('OWASP SCAN') {
            steps {
                dependencyCheck additionalArguments: ' --scan ./', odcInstallation: 'DP'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
    }
}