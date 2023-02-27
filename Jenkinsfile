ipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'flutter build apk'
            }
        }
        stage('Test') {
            steps {
                sh 'flutter test'
            }
        }
    }

    post {
        always {
            archiveArtifacts 'build/app/outputs/flutter-apk/app-release.apk'
        }
    }
}

