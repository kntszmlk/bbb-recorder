pipeline {
  agent any
  stages {
    stage('begin') {
      steps {
        echo "starting '${BUILD_ID}'"
      }
    }
    stage('build') {
      steps {
        sh 'docker build -t registry.uzep.org/uzep.bbbrecorder .'
      }
    }
    stage('tag') {
      steps {
        sh 'docker tag registry.uzep.org/uzep.bbbrecorder registry.uzep.org/uzep.bbbrecorder:${BUILD_ID}'
      }
    }
  }

  options {
    buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
  }
}