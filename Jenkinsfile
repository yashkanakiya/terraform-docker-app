pipeline {
    agent any // Specifies that any available agent can run the pipeline
    tools {
        nodejs 'node-yash-version'
        gradle 'test-gradle'  // Assuming 'test-gradle' is a Gradle tool configured in Jenkins
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building..' // A basic step for demonstration
                // Add actual build commands here (e.g., sh 'make' or bat 'msbuild')
                sh 'node --version'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                // Add test commands here (e.g., sh 'make check')
                sh 'gradle test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                // Add deployment commands here
            }
        }
    }
}
