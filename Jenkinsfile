pipeline{
    agent any
    environment {
        web_directory = '/var/www/html'
        EC2_IP = '13.201.225.46'
    }
    stages{
        stage('Clone git repos') {
            steps {
                git branch: 'main', url: 'https://github.com/Preet814/Jenkins_practice.git'
            }
        }
        stage('Deploy to Apache Server') {
            steps {
                sshagent(['apache-server-ssh']) {  // Use the credentials ID added earlier
                    sh '''
                        ssh root@${EC2_IP} "sudo rm -rf ${web_directory}/*"
                        scp -r * root@${EC2_IP}:${web_directory}/
                        ssh root@${EC2_IP} "sudo systemctl restart apache2"
                    '''
                }
            }
        }
    }
}
