pipeline{
stages{
stage('Fetching cluster Infrastucture Code') {
          steps{
              git branch: 'main', url:'https://github.com/sharonraju143/Project_final.git'
          }  
        }

       stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                    sh 'terraform apply --auto-approve -lock=false'
                    sh 'echo "[Master]" > /etc/ansible/hosts | az vm show -d -g Final_POC -n master-vm --query publicIps -o tsv >> /etc/ansible/hosts'
                    sh 'echo "[worker]" >> /etc/ansible/hosts | az vm show -d -g Final_POC -n worker-vm --query publicIps -o tsv >> /etc/ansible/hosts'
                    sh 'ansible-playbook site.yml'