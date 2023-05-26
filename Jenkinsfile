pipeline {
    agent any

    stages {
        stage('Fetching cluster Infrastructure Code') {
            steps {
                git branch: 'main', credentialsId: 'gitcred', url: 'https://github.com/manojsa5855/infrastructure.git'
            }
        }

        stage('Terraform Init and Apply') {
            steps {
                script {
                   // sh 'az login'
                    sh 'terraform init'
                    sh 'terraform apply --auto-approve -lock=false'
                }
            }
        }

        stage('Configure Ansible') {
            steps {
                script {
                    sh 'echo "[Master]" > /etc/ansible/hosts'
                    sh 'az vm show -d -g 3-tier-1 -n master-vm --query publicIps -o tsv >> /etc/ansible/hosts'
                    sh 'echo "[worker]" >> /etc/ansible/hosts'
                    sh 'az vm show -d -g 3-tier-1 -n worker-vm --query publicIps -o tsv >> /etc/ansible/hosts'
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                script {
                    sh 'ansible-playbook site.yml'
                }
            }
        }
    }
}
