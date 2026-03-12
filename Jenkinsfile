node {
   environment {
        AWS_ACCOUNT_ID = "AKIA4BBCY42UYCJSURU6"
        AWS_REGION = "us-east-1"
        ECR_REPO = "maven-web-app"
        IMAGE_TAG = "latest"

      
    stage('checkout') { 
        git 'https://github.com/AnandVishnu92/Maven-Web-Project.git'
    }
    
    stage('build') {
        sh 'mvn package'
    }
      stage('Copy to EC2') {
            steps {
                sh 'scp -i vish.pem target/*.war ubuntu@ec2-98-92-53-84.compute-1.amazonaws.com:/home/ec2-user/'
            }
        }

        stage('Docker Build and Push') {
            steps {
                sh '''
                ssh -i key.pem ubuntu@ec2-98-92-53-84.compute-1.amazonaws.com << EOF
                docker build -t maven-web-app .
                aws ecr get-login-password --region us-east-1 | \
                docker login --username AWS --password-stdin ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com
                docker tag maven-web-app ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/maven-web-app
                docker push ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com/maven-web-app
                EOF
                '''
            }
}
  
