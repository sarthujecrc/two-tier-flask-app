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
                sh 'docker build -t sarthu/sarthakunion .'
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
                    credentialsId:"dockerhubji",
                    usernameVariable:"dockerhubuser",
                    passwordVariable:"dockerhubpass"
                    )]){
                sh 'docker login -u $dockerhubuser -p  $dockerhubpass'
                sh 'docker image tag   sarthu/sarthakunion $dockerhubuser/sarthakfullapp'
                sh 'docker push $dockerhubuser/sarthakfullapp'
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
