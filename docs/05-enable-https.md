# Enable HTTPS

This guide describes how to enable HTTPS on your Nginx server using Certbot (Let's Encrypt).

## Prerequisites
- A registered domain name pointing to your server's Elastic IP (DNS A record).
- Nginx installed and running on the server.
- Port 80 (HTTP) and 443 (HTTPS) open in your security group.

## 1. Install Certbot and Nginx Plugin
SSH into your EC2 instance and run:
```sh
sudo apt update
sudo apt install certbot python3-certbot-nginx -y
```

## 2. Obtain and Install SSL Certificate
Replace `yourdomain.com` with your actual domain:
```sh
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
```
- Follow the prompts to allow Certbot to configure Nginx and obtain certificates.

## 3. Test Automatic Renewal
Certbot sets up automatic renewal. Test it with:
```sh
sudo certbot renew --dry-run
```

## 4. Verify HTTPS
- Open `https://yourdomain.com` in your browser.
- Confirm you see a secure (padlock) icon and no certificate warnings.

## 5. Troubleshooting
- Ensure DNS is correctly set up and propagated.
- Check Nginx status: `sudo systemctl status nginx`
- Review Certbot logs: `/var/log/letsencrypt/`

## References
- [Certbot Nginx Guide](https://certbot.eff.org/instructions?ws=nginx&os=ubuntufocal)
