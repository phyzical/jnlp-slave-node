pipeline {
    agent {
        label 'master'
    }
    environment {
        DOCKER_HUB_USER = credentials('docker-login')
        DOCKER_HUB_PASSWORD = credentials('docker-password')
        DEPLOYMENT_SLACK_HOOK = credentials('deployment-slack-hook')
    }
    stages {
        stage('Checkout infra') {
            when { tag "v*" }
            steps {
                sh 'echo StrictHostKeyChecking no > ~/.ssh/config'
                withCredentials([sshUserPrivateKey(credentialsId: 'ssh', keyFileVariable: 'SSH_KEY')]) {
                   sh 'cp -prf $SSH_KEY ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa'
                }
                sh 'mkdir -p ../infrastructure'
                dir("../infrastructure")
                {
                    git branch: "master",
                    credentialsId: 'ssh',
                    url: 'git@bitbucket.org:strangeanimals/infrastructure.git'
                }
            }
        }
        stage('Build Image'){
            when { tag "v*" }
            steps {
                sh 'docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASSWORD'
                sh 'make build-and-send-all PRODUCTION_TAG=${TAG_NAME}'
            }
        }
    }
    post {
        failure {
            sh 'make deploy-slack-notification FORCE_DEPLOY_SLACK_NOTIFICATION=TRUE DEPLOYMENT_MESSAGE="* ${GIT_BRANCH} ${TAG_NAME} FAILED!! :*"'
        }
    }
}