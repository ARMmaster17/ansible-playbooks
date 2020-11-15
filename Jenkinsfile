pipeline {
    agent any
    
    stages {
        stage('Pull') {
            steps {
                sshagent(['ansible-shared']) {
                    sh '''
                        ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && git pull'
                    '''
                }
            }
        }
        stage('Validate') {
            steps {
                /*sshagent(['ansible-shared']) {
                    sh '''
                        ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-lint deploy-all.yml'
                    '''
                }*/
                sh 'echo DISABLED'
            }
        }
        stage('APT caching services') {
            steps {
                sshagent(['ansible-shared']) {
                        sh '''
                            ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit apt-cache'
                        '''
                }
            }
        }
        stage('NTP services') {
            steps {
                sshagent(['ansible-shared']) {
                        sh '''
                            ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit ntp'
                        '''
                }
            }
        }
	stage('Zabbix services') {
		steps {
			sshagent(['ansible-shared']) {
				sh '''
					ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit zabbix'
				'''
			}
		}
	}
        stage('Elasticsearch services') {
            steps {
                sshagent(['ansible-shared']) {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                        sh '''
                            ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit elasticsearch'
                        '''
                    }
                }
            }
        }
        stage('Kibana service') {
            steps {
                sshagent(['ansible-shared']) {
                        sh '''
                            ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit kibana'
                        '''
                }
            }
        }
        stage('GNS3 services') {
            steps {
                sshagent(['ansible-shared']) {
                        sh '''
                            ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit gns'
                        '''
                }
            }
        }
        stage('DDNS services') {
            steps {
                sshagent(['ansible-shared']) {
                        sh '''
                            ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit ddns'
                        '''
                }
            }
        }
        stage('MySQL services') {
            steps {
                sshagent(['ansible-shared']) {
                        sh '''
                            ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit mysql'
                        '''
                }
            }
        }
        /*stage('Jenkins services') {
            steps {
                sshagent(['ansible-shared']) {
                    sh '''
                        ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit jenkins'
                    '''
                }
            }
        }*/
        stage('Load balancer services') {
            steps {
                sshagent(['ansible-shared']) {
                    sh '''
                        ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit haproxy'
                    '''
                }
            }
        }
        stage('Reverse proxy services') {
            steps {
                sshagent(['ansible-shared']) {
                        sh '''
                            ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit reverse-proxy'
                        '''
                }
            }
        }
        stage('Honeypot security appliance') {
            steps {
                sshagent(['ansible-shared']) {
                        sh '''
                            ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit hpt'
                        '''
                }
            }
        }
        stage('Apache Spark cluster') {
            steps {
                sshagent(['ansible-shared']) {
                        sh '''
                            ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit spark'
                        '''
                }
            }
        }
        stage('ReX Rescue Services') {
            steps {
                sshagent(['ansible-shared']) {
                        sh '''
                            ssh root@ansible.firecore.lab 'cd /root/ansible-playbooks && ansible-playbook deploy-all.yml --vault-password-file /etc/ansible/vault.secret -i inventory.ini --limit rex'
                        '''
                }
            }
        }
    }
}

