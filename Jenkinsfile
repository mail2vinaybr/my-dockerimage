pipeline {
	environment {
		registry = "vinaybr07/mytest"
		registryCredential = 'docker-id'
		dockerImage = ''
	}
	agent any
		stages {
			stage('Cloning to git'){
				steps {
					git 'https://github.com/mail2vinaybr/my-dockerimage.git'
				}
			}
			stage('Build docker image') {
				steps {
					script {
						dockerImage = docker.build registry + ":$BUILD_NUMBER"
					}
				}
			}
			stage('Deploy Image') {
				steps{
					script {
						docker.withRegistry( '', registryCredential ) {
							dockerImage.push()
						}
					}
				}
			}
			stage('Remove Unused docker image') {
				steps{
					sh "docker rmi $registry:$BUILD_NUMBER"
				}
			}
		}
}
