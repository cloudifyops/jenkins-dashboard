pipeline {
  agent any
    
  tools {docker}
    
  stages {
        
    stage('Cloning Git') {
      steps {
        git 'https://github.com/cloudifyops/jenkins-dashboard'
      }
    }
    stage('Docker Build') {
      steps {
        docker build . --tag jenkins-Dashboard
      }
    }
    stage('Docker Run') {
      steps {
        docker run -d jenkins-Dashboard --name Jenkins-dashboard
      }
    }
  }
}
