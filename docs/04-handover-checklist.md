# Handover Checklist

## Infrastructure
- EC2 instance is reachable via SSH using provided key and user.
- Elastic IP is associated and accessible from the internet.
- Security groups allow required inbound/outbound traffic (e.g., ports 22, 80).

## Storage
- Data (EBS) volume is attached and mounted at the correct path (e.g., /data).
- Sufficient disk space is available and accessible by the application user.

## Application & Services
- Nginx is installed, enabled, and responding on port 80.
- Default or custom Nginx page is accessible via browser at `http://<ELASTIC_IP>`.
- All required system packages and dependencies are installed.

## Configuration & Documentation
- Ansible inventory and playbooks are up to date and provided to the client.
- Terraform state and configuration files are handed over or stored securely.
- Documentation for client execution, recovery, and responsibilities is complete and shared.

## Credentials & Access
- SSH key(s) and access details are securely shared with the client.
- AWS IAM user/role access (if applicable) is provided or transferred.

## Final Verification
- All services restart successfully after a reboot.
- Client has successfully logged in and verified access.
- Any open issues or limitations are documented and communicated.
