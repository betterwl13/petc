node {
     def changeLog
 try {
    env.JAVA_HOME="${tool 'Java8'}"
    env.PATH="${env.JAVA_HOME}/bin:${env.PATH}"
    buildInfo.env.capture = true

    stage ('Checkout') {
	checkout scm
    }

    stage ('Build') {
        buildInfo.env.collect()
	buildInfo = Maven.run pom: 'pom.xml', goals: 'clean install'
    }

}
} catch (e) {
        currentBuild.result = 'FAILURE'
        emailext body: "See ${env.BUILD_URL}", recipientProviders: [[$class: 'DevelopersRecipientProvider']], subject: "${env.JOB_NAME} - ${env.BUILD_NUMBER} FAILED"
        throw e
  }
}
