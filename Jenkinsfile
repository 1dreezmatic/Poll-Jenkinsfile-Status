pipeline {
    agent any

    stages{
  
        stage('build') {

            steps {
                echo 'building image via Dockerfile'
            }
        }

        stage('test') {

            steps {
                echo 'unit test in progress'
                echo 'lint test in progress'
            }
        }

        stage('push') {

            steps {
                echo 'pushing image to Nexus Artifact Repository'
            }
        }

        stage('pull') {

            steps {
                echo 'pulling image with tag from Nexus Artifact Repository'
            }
        }

        stage('deploy to UAT') {

            steps {
                echo 'run pulled image for User acceptance testing'
            }
        }
    }
}
