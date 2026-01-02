# Client Execution Guide

## 1. Run Terraform to Create Infrastructure

- Ensure you have [Terraform](https://www.terraform.io/downloads.html) installed.
- Navigate to the Terraform directory:
  ```sh
  cd terraform
  ```
- Initialize Terraform:
  ```sh
  terraform init
  ```
- Review the execution plan:
  ```sh
  terraform plan
  ```
- Apply the configuration to create resources:
  ```sh
  terraform apply
  ```
- Confirm the action when prompted.

## 2. Copy Elastic IP from Output

- After `terraform apply` completes, note the `elastic_ip` value in the output. This is the public IP address of your EC2 instance.

## 3. Update Ansible Inventory

- Open the Ansible inventory file (e.g., `inventory.ini`).
- Replace the placeholder or previous IP address with the new Elastic IP:
  ```ini
  [web]
  <ELASTIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/your-key.pem
  ```
- Save the file.

## 4. Run Ansible Playbook

- Ensure you have [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed.
- Run the playbook to configure the server:
  ```sh
  ansible-playbook -i inventory.ini playbook.yml
  ```
- Wait for the playbook to complete successfully.

## 5. Verify Nginx on Port 80

- Open a web browser and navigate to:
  ```
  http://<ELASTIC_IP>
  ```
- You should see the default Nginx welcome page or your configured site.

## Troubleshooting

- If you cannot connect, check your security group rules in AWS to ensure port 80 is open.
- Verify your SSH key permissions and user settings in the inventory file.
- Review Ansible and Terraform logs for errors.
