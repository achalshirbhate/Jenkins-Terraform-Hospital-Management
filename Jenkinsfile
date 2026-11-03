pipeline {
    agent any

    options {
        timestamps()
    }

    environment {
        DB_URL = 'jdbc:postgresql://127.0.0.1:5432/hospital_ci_db'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                dir('application') {
                    sh 'chmod +x mvnw'
                    sh './mvnw -B -DskipTests clean compile'
                }
            }
        }

        stage('Test') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'hospital-ci-db',
                        usernameVariable: 'DB_USERNAME',
                        passwordVariable: 'DB_PASSWORD'
                    )
                ]) {
                    dir('application') {
                        sh './mvnw -B test'
                    }
                }
            }
        }

        stage('Package') {
            steps {
                dir('application') {
                    sh './mvnw -B -DskipTests package'
                }
            }
        }
    }

    post {
        always {
            junit 'application/target/surefire-reports/*.xml'
            archiveArtifacts artifacts: 'application/target/*.jar',
                             fingerprint: true,
                             allowEmptyArchive: true
        }
    }
}
