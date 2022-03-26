pipeline {
    agent any
    tools {
  maven 'maven10'
}
    stages {
        stage('git checkout') {
            steps {
                git branch: 'feature', url: 'https://github.com/dhanu9509/springmvc'
            }
        }
        stage('maven build'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('nexus upload'){
            steps{
                nexusArtifactUploader artifacts: [[artifactId: 'springmvc', classifier: '', file: 'target/springmvc.war', type: 'war']], credentialsId: 'nexus', groupId: 'inn.javahome', nexusUrl: '54.208.245.104:8081', nexusVersion: 'nexus2', protocol: 'http', repository: 'spingmvc-demo2', version: '2.0'
            }
        }
        stage('deploy stage') {
            steps {
                echo 'Hello deploy'
                sshPublisher(publishers: [sshPublisherDesc(configName: 'tomcatnb', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/opt/tomcat10/webapps/', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '/var/lib/jenkins/workspace/dev-env/target/springmvc.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
    }
}
