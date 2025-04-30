pipeline {
    agent any

    environment {
        APACHE_SERVER = "65.1.94.191"  // Apache server IP (EC2 or other)
        APACHE_USER = "ubuntu"  // SSH Username (e.g., ubuntu for EC2)
        WEBSITE_DIR = "/var/www/html"  // Apache document root
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the code from GitHub (assuming you have a simple index.html file)
                git branch: 'main', url: 'https://github.com/Preet814/Jenkins_practice.git'
                echo "${APACHE_SERVER}"
                echo "${APACHE_USER}"
                echo "${WEBSITE_DIR}"
            }
        }

        stage('Deploy to Apache Server') {
            steps {
                sshagent (credentials: ['jenkins-ssh-key-id']) {
                    sh """
                        # Ensure ~/.ssh directory exists
                        [ -d ~/.ssh ] || mkdir ~/.ssh && chmod 0700 ~/.ssh
                        
                        # Add EC2 host to known_hosts using env vars
                        ssh-keyscan -H $APACHE_SERVER >> ~/.ssh/known_hosts
                        
                        # Run echo on EC2 using env vars
                        ssh $APACHE_USER@$APACHE_SERVER 'echo Hello from EC2 using Jenkins pipeline!'
                    """
                }
            }
        }

        // stage('Restart Apache') {
        //     steps {
        //         script {
        //             // Restart Apache server to serve the new index.html
        //             sh """
        //             ssh -i ${SSH_KEY} ${APACHE_USER}@${APACHE_SERVER} 'sudo systemctl restart apache2'
        //             """
        //         }
        //     }
        // }
    }

    post {
        success {
            echo "Deployment Successful! Static website deployed."
        }
        failure {
            echo "Deployment Failed!"
        }
    }
}
