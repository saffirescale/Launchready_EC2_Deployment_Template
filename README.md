# LaunchReady – Secure EC2 Deployment Baseline

LaunchReady is a **safe, minimal, and production-ready AWS EC2 foundation** designed for startups, MVPs, and teams that want a reliable cloud setup without unnecessary complexity.

It provides a **clean starting point** for running applications on AWS with strong emphasis on:
- Safety
- Recoverability
- Clear ownership
- Cost control

Application code is intentionally **not included**.

---

## What LaunchReady Provides

### Infrastructure Safety
- Dedicated EC2 instance
- Static public IP (Elastic IP)
- Persistent storage independent of server lifecycle
- Controlled network access (firewall rules)

### Operational Stability
- Predictable server configuration
- No hidden automation
- No “magic scripts”
- Fully auditable setup

### Clear Boundaries
- Infrastructure and base OS are managed
- Application logic remains client-owned
- No vendor lock-in

---

## Key Features

### 🔐 Security-First by Default
- SSH access only via key-based authentication
- Firewall rules restricted to required ports only
- Application ports are never exposed directly
- HTTPS supported when a domain is ready (optional)

### 💾 Data Safety
- Application data stored on a **separate persistent volume**
- Data survives:
  - EC2 stop/start
  - EC2 replacement
- Clear recovery steps documented

### 🔁 Recovery & Continuity
- If the server is stopped → no action needed
- If the server is replaced → data and IP can be reattached
- Recovery process is documented and repeatable

### 🧱 Simplicity Over Complexity
- No Kubernetes
- No auto-scaling surprises
- No opaque CI/CD
- Easy to understand for any DevOps team

---

## What This Setup Is Ideal For

- Early-stage startups
- MVPs going live for the first time
- Internal tools
- SaaS products in early growth
- Teams that value control over abstraction

---

## What This Setup Is *Not*

To avoid misunderstandings, this setup is **not**:

- A Platform-as-a-Service (PaaS)
- A zero-downtime multi-region system
- An auto-scaling architecture
- A fully managed application runtime

These can be added later **when the business requires it**.

---

## HTTPS & Domains

- HTTPS is supported via industry-standard certificates
- Enabled only when:
  - A domain is available
  - DNS points to the server
- Certificates auto-renew once enabled

HTTPS is **optional**, not forced.

---

## Transparency & Ownership

### What You Own
- AWS account
- EC2 instance
- Data volume
- Application code
- Domain & DNS

### What This Setup Ensures
- Your data is not locked to a specific server
- Your infrastructure can be handed over to any DevOps team
- Your system can evolve without rework

---

## Operational Philosophy

> “Start simple. Make it safe. Scale only when needed.”

This foundation is designed to:
- Reduce launch risk
- Avoid over-engineering
- Keep monthly cloud costs predictable
- Enable future growth without throwing away work

---

## Documentation & Handover

All operational knowledge is documented:
- Initial setup
- Day-to-day operation
- Server restart scenarios
- Disaster recovery steps

No tribal knowledge required.

---

## Status

**Stable baseline**  
Designed to be used as-is.

Enhancements are made **only when business needs justify them**.

---

## Questions?

This repository is intentionally conservative.
If you are unsure whether this setup fits your needs, that discussion should happen **before adding complexity**.
