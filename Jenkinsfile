pipeline{
    agent any 
    stages{
        stage("Code"){
            steps{
                git url:"https://github.com/sarthujecrc/two-tier-flask-app.git",branch:"main"
            }
        }
        stage("Build"){
            steps{
                sh 'docker build -t sarthu/sarthaksinghal .'
            }
        }
        stage("Test"){
            steps{
                sh 'test cases'
            }
        }
        stage("Docker hub"){
            steps{
                withCredentials([usernamePassword(
                    credentialsId:"dockerhubsarthak",
                    usernameVariable:"dockerhubusername",
                    passwordVariable:"dockerhubpassword"
                    )]){
                sh 'docker login -u $dockerhubusername -p $dockerhubpassword'
                sh 'docker image tag sarthu/sarthaksinghal $dockerhubusername/sarthakunion '
                sh 'docker push $dockerhubusername/sarthakunion'
                }
            }
        }
        stage("Deploy"){
            steps{
                sh 'docker compose up -d '
            }
        }
    }
}
