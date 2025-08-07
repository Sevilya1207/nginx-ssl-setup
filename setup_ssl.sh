#!/bin/bash

# Ask user for domain and email
read -p "Enter your domain (e.g. example.com): " DOMAIN
read -p "Enter your email for Let's Encrypt registration: " EMAIL

# Output DNS instructions
echo ""
echo "====== DNS SETUP REQUIRED ======"
echo "To use Let's Encrypt on a public server, make sure the following DNS records are configured:"
echo ""
echo "A Record:"
echo "  $DOMAIN -> YOUR_PUBLIC_IP"
echo ""
echo "Optional (recommended):"
echo "  www.$DOMAIN -> YOUR_PUBLIC_IP"
echo ""
echo "You can check DNS propagation with:"
echo "  dig +short $DOMAIN"
echo "  dig +short www.$DOMAIN"
echo ""
echo "Make sure your server is publicly accessible on ports 80 and 443."
echo "Example test:"
echo "  curl http://$DOMAIN"
echo ""

read -p "Have you added the DNS records and verified that your domain points to this server? (y/n): " CONFIRM

if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
  echo "Aborting. Please configure your DNS and try again."
  exit 1
fi

# Ask for webroot path
read -p "Enter your webroot path (default: /var/www/site): " WEBROOT
WEBROOT=${WEBROOT:-/var/www/site}

# Run certbot (you can run this inside Docker container with docker exec if needed)
echo ""
echo "====== Running Certbot ======"
echo "This may take a few seconds..."

sudo certbot certonly --webroot \
  -w "$WEBROOT" \
  -d "$DOMAIN" \
  -d "www.$DOMAIN" \
  --email "$EMAIL" \
  --agree-tos \
  --non-interactive

STATUS=$?

if [[ $STATUS -eq 0 ]]; then
  echo ""
  echo "✅ Certificate successfully issued!"
  echo "Certificates saved in /etc/letsencrypt/live/$DOMAIN/"
  echo ""
  echo "You can now configure Nginx with SSL like so:"
  echo ""
  echo "ssl_certificate /etc/letsencrypt/live/$DOMAIN/fullchain.pem;"
  echo "ssl_certificate_key /etc/letsencrypt/live/$DOMAIN/privkey.pem;"
else
  echo ""
  echo "❌ Failed to obtain certificate. Check domain DNS or firewall."
fi
