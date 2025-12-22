pipeline {
    agent any // Specifies that any available agent can run the pipeline
    stages {
        stage('Build') {
            steps {
                echo 'Building..' // A basic step for demonstration
                // Add actual build commands here (e.g., sh 'make' or bat 'msbuild')
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                // Add test commands here (e.g., sh 'make check')
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
