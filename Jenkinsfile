pipeline {
  agent {
    docker {
      image 'docker:lts'
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