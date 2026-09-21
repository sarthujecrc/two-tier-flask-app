pipeline{
    agent any 
    stages{
        stage("Code Clone"){
            steps{
                git url:"https://github.com/sarthujecrc/two-tier-flask-app.git",branch:"main"
            }
        }
        stage("Build"){
            steps{
                sh 'docker build -t sarthu/flasksarthuapp .'
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
                    credentialsId:"dockerhubsarthak",
                    usernameVariable:"dockerhubuser",
                    passwordVariable:"dockerhubpassword"
                    
                    )]){
                sh 'docker login -u $dockerhubuser -p $dockerhubpassword'
                sh 'docker image tag  sarthu/flasksarthuapp $dockerhubuser/sarthaksinghal'
                sh 'docker push   $dockerhubuser/sarthaksinghal '
                }
            }
        }
        stage("Deploy"){
            steps{
                sh 'docker compose up -d'
            }
        }
    }
}
