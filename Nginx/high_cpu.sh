Perfect! Let's walk through a practical DevOps lab that simulates a high-CPU process, allowing you to observe, debug, and inform — just like you'd do in production.

🧪 Lab: Simulate & Debug High CPU Process (Realistic DevOps Scenario)
🔧 Prerequisites
Make sure the following tools are installed on your Ubuntu server:

bash
Copy
Edit
sudo apt update
sudo apt install apache2-utils htop strace lsof -y
🔁 Step 1: Start a Lightweight Web Server (NGINX)
If not already running:

bash
Copy
Edit
sudo apt install nginx -y
sudo systemctl start nginx
📍 Access URL: http://<your-server-ip>

🔥 Step 2: Simulate High CPU Load with ApacheBench
Now simulate traffic:

bash
Copy
Edit
ab -n 10000 -c 100 http://<your-server-ip>/
-n 10000: total 10,000 requests

-c 100: 100 concurrent users

📈 This will push NGINX hard and increase CPU usage.

🔎 Step 3: Monitor in Real-Time
Open another terminal or split pane:

bash
Copy
Edit
htop
Or:

bash
Copy
Edit
top
📌 Watch which PID uses high CPU (likely nginx or another spawned process)

🕵️ Step 4: Investigate the PID
a. Find details about the process:
bash
Copy
Edit
ps -p <PID> -o pid,ppid,cmd,%cpu,%mem,etime
b. See what files it's using:
bash
Copy
Edit
lsof -p <PID> | less
c. Check what it’s doing now (Syscalls):
bash
Copy
Edit
strace -p <PID> -o /tmp/debug.log
📂 Step 5: Check Logs
bash
Copy
Edit
tail -f /var/log/nginx/access.log
tail -f /var/log/nginx/error.log
Look for:

Burst in requests

Error responses

Possible misconfigurations

🧘 Step 6: Contain (Optional, Do Not Kill)
Lower CPU priority without killing:

bash
Copy
Edit
sudo renice +19 -p <PID>
📢 Step 7: Prepare an Inform Report
Template you can use in Slack/Email:

yaml
Copy
Edit
🚨 ALERT: High CPU usage on production web server

🔹 PID: 1324
🔹 Service: NGINX (/usr/sbin/nginx)
🔹 CPU: 98%
🔹 Duration: 5 min
🔹 Log Insight: High traffic to /search?q= endpoint (~200 RPS)
🔹 Action: Temporarily reniced to +19
🔹 Recommendation: Add rate limiting in NGINX config

cc: App Team, SREs
