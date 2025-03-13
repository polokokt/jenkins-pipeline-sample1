pipeline {
    agent any
    environment {
        PASS = credentials("registry-pass")
        SONAR_TOKEN = credentials('SONAR_TOKEN')
    }
    stages {
        stage('Build and Package Application (Maven, Docker)') {
            steps {
                sh '''
                    ./jenkins/build/maven.sh mvn -B -DskipTests clean package
                    ./jenkins/build/build.sh
                '''
            }
            post {
                success {
                    archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
                }
            }
        }
        stage('Static Code Analysis with SonarQube') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh '''
                        ./jenkins/sonar/sonar.sh
                    '''
                }
            }
        }
        stage('Run Unit Tests and Generate Reports (Docker, Maven)') {
            steps {
                sh '''
                    ./jenkins/test/test.sh mvn test
                '''
            }
            post {
                always {
                    junit 'java-app/target/surefire-reports/*.xml'
                }
            }
        }
        stage('Build and Push Docker Image to Docker Hub') {
            steps {
                sh '''
                    ./jenkins/push/push.sh
                '''
            }
        }
        stage('Deploy Application Container on Remote Host') {
            steps {
                sh '''
                    ./jenkins/deploy/deploy.sh
                '''
            }
        }
    }
    post {
        always {
            echo 'Finished'
        }
    }
}