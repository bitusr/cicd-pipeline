pipeline {
  agent any

  tools {
    nodejs 'nodejs-22.12.0'
  }

  environment {
    DOCKERHUB_CREDS = credentials('dockerhub-creds')
    DOCKER_IMAGE_NAME = 'bitusr/test-jenkins-pipeline'
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
        sh "docker image build -t $DOCKER_IMAGE_NAME:${BUILD_NUMBER} ."
      }
    }

    stage('Publish docker image') {
      
      steps {
        sh "docker login -u $DOCKER_CREDENTIALS_USR -p $DOCKER_CREDENTIALS_PSW"
        sh "docker push $DOCKER_IMAGE_NAME:${BUILD_NUMBER}"
      }
    }

  }
}
