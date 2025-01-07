pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
        docker { image 'node:22-alpine' }
      }
      steps {
        sh 'sh ./scripts/build.sh'
      }
    }

    stage('Test') {
      agent {
        docker { image 'node:22-alpine' }
      }
      steps {
        sh 'sh ./scripts/test.sh'
      }
    }

    stage('Build docker image') {
      agent {
        dockerfile true
      }
      steps {
        sh 'docker image build -t cicd-pipeline-image .'
      }
    }

  }
}
