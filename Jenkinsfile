pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
        docker { image 'node:22-alpine' }
        volumes ['${WORKSPACE}:/workspace']
      }
      steps {
        sh 'sh ./scripts/build.sh'
      }
    }

    stage('Test') {
      agent {
        docker { image 'node:22-alpine' }
        volumes ['${WORKSPACE}:/workspace']
      }
      steps {
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

  }
}
