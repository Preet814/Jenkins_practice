pipeline{
    agent any
    environment {
        web_directory = '/var/www/html'
    }
    stages{
        stage('Clone git repos') {
            steps {
                git branch: 'main', url: 'https://github.com/Preet814/Jenkins_practice.git'
            }
        }
        stage('Deploy to apache') {
            steps {
                sh '''
                    sudo rm -rf ${web_directory}/*
                    sudo cp index.html ${web_directory}/
                '''
            }
        }
        stage('Restart Apache') {
            steps {
                sh 'sudo service apache restart'
            }
        }
    }
}
