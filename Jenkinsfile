pipeline {
	environment {
		registry = "vinaybr07/mytest"
		registryCredential = 'docker-id'
	}
	
	agent any
		stages {
			stage('checkout'){
				steps {
					checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mail2vinaybr/my-dockerimage.git']]])
				}
			}
			stage('Build docker image') {
				steps {
					script {
						docker.build registry + ":$mydeploy"
					}
				}
			}
		}
}
