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
                sh 'docker build -t sarthu/flaskapplication .'
            }
        }
        stage("Test"){
            steps{
                echo "test cases"
            }
        }
        stage("Docker hub"){
            steps{
                withCredentials([usernamePassword(
                    credentialsId:"dockerhubsarthu",
                    usernameVariable:"dockerhubuser",
                    passwordVariable:"dockerhubpassword"
                    
                    )]){
                sh 'docker login -u $dockerhubuser -p $dockerhubpassword'
                sh 'docker image tag sarthu/flaskapplication  $dockerhubuser/flasksarthuapp'
                sh 'docker push $dockerhubuser/flasksarthuapp'
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
