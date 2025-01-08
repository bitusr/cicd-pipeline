pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
        docker {
          image 'node:22-alpine'
        }

      }
      steps {
        sh 'sh ./scripts/build.sh'
      }
    }

    stage('Test') {
      agent {
        docker {
          image 'node:22-alpine'
        }

      }
      steps {
        sh 'sh ./scripts/build.sh'
        sh 'sh ./scripts/test.sh'
      }
    }

    stage('Build docker image') {
      agent {
        docker {
          image 'docker:24.0.5'
          args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
        }

      }
      steps {
        sh 'docker image build -t cicd-pipeline-image .'
      }
    }

    stage('') {
      environment {
        dockerhub_creds = 'dockerhub-creds'
      }
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_creds_id')

          {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
          }
        }

      }
    }

  }
}