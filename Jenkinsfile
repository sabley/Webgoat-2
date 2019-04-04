node {
    def app

    stage('Clone repository') {

        checkout scm
    }

    stage('Build image') {

        sh 'mvn clean package -DskipTests=true'
    }

    stage('Test image') {
        
        nexusPolicyEvaluation failBuildOnNetworkError: false, iqApplication: manualApplication('webgoat'), iqStage: 'release', jobCredentialsId: ''
    }
	
    stage('Publish to NXRM') {
	
        nexusPublisher nexusInstanceId: 'nxrm3', nexusRepositoryId: 'maven-releases', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: 'target/WebGoat-6.0.1.war']], mavenCoordinate: [artifactId: 'fancyWidget', groupId: 'com.mycompany', packaging: 'war', version: '1.1']]], tagName: 'build-126'
    }	
/*
    stage('Push image') {
         
			You would need to first register with DockerHub before you can push images to your account
		
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    }*/
}
