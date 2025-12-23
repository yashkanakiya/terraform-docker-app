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
        stage('Frontend') {
            steps {
                node.js('node-yash-version') {
                sh 'npm install'           
                }
                echo 'FRONTEND....'
                // Add deployment commands here
            }
        }
        stage('Backend') {
            steps {
                withGradle('test-gradle') {
                sh './gradlew -v'
                }
                echo 'BACKEND....'
                // Add deployment commands here
            }
        }
    }
}
