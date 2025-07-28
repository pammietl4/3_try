✅ Scenario: “Nginx service stopped working on my server”
🔧 Step-by-step Summary (Interview Style)
🧑‍💻 Step 1: Noticed Website Not Responding
I tried accessing my server using:

curl -I http://<server-ip>
But I didn’t get any response — not even an error. That told me something is seriously wrong with the web server (Nginx).

🔍 Step 2: Checked Nginx Status

systemctl status nginx
It showed that Nginx had failed. So I ran:


journalctl -xeu nginx.service
This gave me detailed logs about the error.

Lesson: As a DevOps engineer, journalctl helps me understand why a service failed.

🔨 Step 3: Tried Restarting Nginx

sudo systemctl restart nginx
But it still failed. So I suspected some process might be stuck or frozen.

🕵️ Step 4: Checked Running Nginx Processes

ps -ef | grep -i nginx
This showed only a “worker process” was running — but no “master process”, which usually controls and spawns the workers.

That was a red flag.

💀 Step 5: Tried Killing the Stuck Worker

sudo kill -9 <PID>
Even after killing, the process still remained frozen in state t (stopped by a signal). I checked its state using:

bash
Copy
Edit
ps -o pid,stat,comm -p <PID>
🤯 Realization: Process Was Frozen
The process state was t, which means it was "traced or stopped" — like being paused by the OS.

I tried resuming it with:

sudo kill -CONT <PID>
But nothing changed. It stayed stuck.

📌 Root Cause Found: ulimit (System Resource Limits)
I ran:

ulimit -a
Here I noticed:

open files (-n) was only 1024, meaning each process can open a maximum of 1024 files.

Nginx, being a web server, opens many files: logs, connections, configs — so hitting this limit can freeze or crash it.

🛠️ Step 6: Fixed the File Limit
To permanently fix the issue, I increased the open file limit to 65535:

Edited /etc/security/limits.conf:

* soft nofile 65535
* hard nofile 65535
Enabled limits in PAM config:

sudo nano /etc/pam.d/common-session
session required pam_limits.so
Set file limit for Nginx in systemd:

sudo nano /etc/systemd/system/nginx.service.d/override.conf
[Service]
LimitNOFILE=65535
Reloaded systemd and restarted:

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart nginx
✅ Outcome:
Nginx restarted successfully.

No more freezing.

System resource limits are now tuned for production-level load.

📣 What I’d Say in an Interview:
“There was a time when the Nginx web server froze — no response from curl, and systemctl showed a failed state. 
I found that only the worker process was stuck, and the master was missing. 
After deep inspection using ps, kill, and ulimit, I discovered that the system was hitting its file descriptor limit. 
I increased the ulimit for Nginx using limits.conf and systemd overrides, rebooted the server, and the issue was permanently resolved. 
This experience taught me how deeply OS-level limits can impact services and how to fix them properly for production workloads.”
