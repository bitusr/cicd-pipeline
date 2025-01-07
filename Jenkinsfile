pipeline {
  agent {
    docker {
      image 'node:22-alpine'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'sh ./scripts/build.sh'
      }
    }

    stage('Test') {
      steps {
        sh 'sh ./scripts/test.sh'
      }
    }

    stage('Build docker image') {
      steps {
        sh 'docker image build -t cicd-pipeline-image .'
      }
    }

  }
}