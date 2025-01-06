pipeline {
  agent {
    docker {
      image 'node:22-alpine'
      args '-p 3000:3000'
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

  }
}