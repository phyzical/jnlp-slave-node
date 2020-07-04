pipeline {
    // todo find a good docker agent?
//     agent {
//         label 'vue'
//     }
    environment {
        DOCKER_HUB_USER = credentials('docker-login')
        DOCKER_HUB_PASSWORD = credentials('docker-password')
        DEPLOYMENT_SLACK_HOOK = credentials('deployment-slack-hook')
    }
    stages {
        stage('Build Image'){
            when { tag "v*" }
            steps {
                sh 'make deploy-slack-notification DEPLOYMENT_MESSAGE="*Building ${GIT_BRANCH} ${TAG_NAME} Docker Image :*"'
                sh 'docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASSWORD'
                sh 'make build-and-send'
            }
        }
    }
    post {
        failure {
            sh 'make deploy-slack-notification DEPLOYMENT_MESSAGE="* ${GIT_BRANCH} ${TAG_NAME} FAILED!! :*"'
        }
    }
}