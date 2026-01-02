# Instance Recovery Guide

## 1. EC2 Stop/Start Recovery

If your EC2 instance was stopped and started (not terminated):

- No manual action is required if the instance was managed by Terraform and Ansible.
- The Elastic IP and EBS volume should remain attached automatically.
- If you experience issues:
  - Verify the instance state in the AWS Console.
  - Ensure the Elastic IP is still associated.
  - SSH into the instance to check service status:
    ```sh
    ssh -i ~/.ssh/your-key.pem ubuntu@<ELASTIC_IP>
    sudo systemctl status nginx
    ```
  - Restart services if needed:
    ```sh
    sudo systemctl restart nginx
    ```

## 2. EC2 Replacement (Instance Terminated or Unrecoverable)

If the EC2 instance must be replaced:

### a. Recreate EC2 Instance
- Use Terraform to recreate the instance:
  ```sh
  terraform apply
  ```
- Confirm the new instance is created.

### b. Reattach EBS Volume (if using separate EBS)
- In the AWS Console, detach the EBS volume from the old instance (if still present).
- Attach the EBS volume to the new instance.
- SSH into the new instance and mount the volume as needed.

### c. Reassign Elastic IP
- In the AWS Console, associate the existing Elastic IP with the new instance.
- Update your Ansible inventory with the new public IP if it changed.

### d. Re-run Ansible Playbook
- Run the Ansible playbook to configure the new instance:
  ```sh
  ansible-playbook -i inventory.ini playbook.yml
  ```

### e. Verify Recovery
- Access the application or Nginx via the Elastic IP in your browser:
  ```
  http://<ELASTIC_IP>
  ```
- Confirm services are running as expected.

## Troubleshooting
- Check AWS Console for instance and volume status.
- Review Ansible and system logs for errors.
- Ensure security groups and key pairs are correct.
