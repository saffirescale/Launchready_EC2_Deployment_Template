# Client Responsibilities

## DevOps Team Responsibilities

The DevOps team is responsible for:

- **Infrastructure Provisioning**
  - Creating and managing AWS resources (EC2, EBS, VPC, Security Groups, Elastic IP, etc.) using Terraform.
  - Ensuring infrastructure is reproducible and documented.
- **Base Operating System Setup**
  - Installing and configuring the base OS (e.g., Ubuntu) on the EC2 instance.
  - Applying security updates and basic hardening.
  - Installing and configuring core system packages (e.g., Nginx, Docker, etc. as required).
- **Automation & Configuration Management**
  - Writing and maintaining Ansible playbooks for server configuration.
  - Ensuring idempotent and repeatable deployments.
- **Documentation**
  - Providing clear guides for client execution, recovery, and handover.

## Client Responsibilities

The client is responsible for:

- **Application Deployment & Management**
  - Deploying, configuring, and maintaining their application on the provisioned infrastructure.
  - Managing application dependencies, environment variables, and runtime configuration.
  - Monitoring application health and performance.
- **DNS Management**
  - Registering and managing domain names.
  - Creating and updating DNS records to point to the provided Elastic IP or load balancer.
- **Ongoing Maintenance**
  - Applying application-level updates and patches.
  - Managing SSL certificates (unless otherwise agreed).
- **Security & Compliance**
  - Ensuring application-level security and compliance requirements are met.

## Shared Responsibilities (if applicable)

- **Incident Response**
  - Coordinating on troubleshooting and recovery in case of outages.
- **Access Management**
  - Managing SSH keys and user access as agreed.
