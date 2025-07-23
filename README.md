![image](https://github.com/pammietl4/3_try/assets/63113628/c10d2298-40c0-4f47-8358-e2e81ac13a20)


# **Devops Engineer Role**

## <u>Tools</u>

* GIT
* Docker
* Jenkins
* Ansible
* K8s


## <u>Cloud</u>
 * AWS/Azure/GCP

 ## <u>Iac</u>
  * Terraform

## <u>Packer best video</u> -- https://www.youtube.com/watch?v=BAlG6hXIGok


[![GitHub Streak](https://streak-stats.demolab.com?user=pammi&theme=dark)](https://git.io/streak-stats)

@Pammi :+1: It's already late, please Work Hard


Absolutely! Let’s cook your Pammimart EC2 website setup just like making Chicken Biryani — spicy, step-by-step, and full of flavor 😄🍗💻

🍗 DevOps Chicken Biryani Style – Hosting Pammimart on EC2 with Nginx
Each step is like an ingredient or cooking step in biryani!

🧅 Step 1: Marinate Chicken (Launch EC2 & Install Nginx)
“First, get the chicken ready…”

✅ Launch an EC2 instance (like getting your chicken from the market):

Choose Ubuntu Server (e.g., 22.04)

t2.micro (free tier eligible)

Add key pair (for SSH login)

✅ Install Nginx (our cooking oil):

bash
Copy
Edit
sudo apt update
sudo apt install nginx -y
✅ Start the fire (Nginx service):

bash
Copy
Edit
sudo systemctl enable nginx
sudo systemctl start nginx
🧂 Step 2: Add Masala (Configure Firewall)
“No spice, no taste. Open the ports!”

✅ Go to AWS → EC2 → Security Groups → Inbound Rules
Add:

Type	Protocol	Port	Source
HTTP	TCP	80	0.0.0.0/0

✅ (Optional) Also allow SSH (port 22) to manage the server.

🍚 Step 3: Prepare Rice (Create Web Directory)
“Put the rice to boil – create a folder to host the site.”

bash
Copy
Edit
sudo mkdir -p /var/www/pammimart
sudo chown -R $USER:$USER /var/www/pammimart
✅ Add your HTML:

bash
Copy
Edit
echo "<h1>🛒 Welcome to Pammimart - Flipkart Style Site</h1>" > /var/www/pammimart/index.html
🍗 Step 4: Cook Chicken (Create Nginx Site Config)
“Now, mix chicken with spices and let it cook.”

bash
Copy
Edit
sudo nano /etc/nginx/sites-available/pammimart
Paste:

nginx
Copy
Edit
server {
    listen 80;
    server_name pammimart.com www.pammimart.com 44.202.112.59;

    root /var/www/pammimart;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    access_log /var/log/nginx/pammimart.access.log;
    error_log /var/log/nginx/pammimart.error.log;
}
🍳 Step 5: Dum Cooking (Enable Config & Restart Nginx)
“Seal the pot and let the biryani cook on low flame!”

✅ Enable site:

bash
Copy
Edit
sudo ln -s /etc/nginx/sites-available/pammimart /etc/nginx/sites-enabled/
✅ Test config:

bash
Copy
Edit
sudo nginx -t
✅ Restart to apply:

bash
Copy
Edit
sudo systemctl reload nginx
🧄 Step 6: Layer with Garnish (Test Locally)
“Garnish it! Add fried onions. Check if it’s smelling nice.”

bash
Copy
Edit
curl http://localhost
✅ You should see:

css
Copy
Edit
<h1>🛒 Welcome to Pammimart - Flipkart Style Site</h1>
✅ Test from public IP:

bash
Copy
Edit
curl http://44.202.112.59
✅ Or from browser:

cpp
Copy
Edit
http://44.202.112.59
🧪 Step 7: Taste Test (Browser Debugging)
If it's not loading in the browser:

Try incognito window

Check security group for port 80

Use online tool like https://tools.keycdn.com/http-check

🥗 BONUS: Raita & Salad (Domain + SSL)
“Biryani without raita? Domain without HTTPS? No way!”

✅ If you have a domain (like pammimart.com):

Point A record to your EC2 public IP

✅ Then install HTTPS with Let’s Encrypt:

bash
Copy
Edit
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d pammimart.com -d www.pammimart.com
🍽️ Final Dish: Pammimart is Ready!
cpp
Copy
Edit
http://44.202.112.59
or
http://pammimart.com
Visitors see your own Flipkart-style e-commerce page served hot 🔥!

