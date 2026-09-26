pipeline{
    agent any 
    stages {
        stage("Code"){
            steps{
            git url:"https://github.com/sarthujecrc/two-tier-flask-app.git",branch:"main"
            }
        }
        stage("Build"){
            steps{
                sh 'docker build -t sarthu/sarthakfullapp .'
            }
        }
        stage("Test"){
            steps{
                echo "test cases"
            }
        }
        stage("Docker Hub"){
            steps{
                withCredentials([usernamePassword(
                    credentialsId:"dockerhubcred",
                    usernameVariable:"dockerhubuser",
                    passwordVariable:"dockerhubpass"
                    )]){
                sh 'docker login -u $dockerhubuser -p $dockerhubpass'
                sh 'docker image tag  sarthu/sarthakfullapp $dockerhubuser/sarthujecrcio'
                sh 'docker push $dockerhubuser/sarthujecrcio'
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
