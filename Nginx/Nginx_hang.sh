✅ DevOps Interview Cheat Sheet: Nginx Hung Process Debugging

🔹 1. Situation Overview
We faced an issue where:

Nginx service failed to restart after killing its master process (PID 584).

Even kill -9 didn’t remove the process.

systemctl restart nginx kept failing.

journalctl logs said the process was still running even after sending multiple SIGKILLs.

🔹 2. Understanding the Architecture
Nginx runs with two types of processes:

Master Process (runs as root): controls the config, spawns workers.

Worker Process (runs as www-data): handles actual web requests.

Killing the master process doesn’t always stop the workers.

🔹 3. What went wrong
We used:

sudo kill -9 584
But:

The process did not die.

Even after pkill -9 nginx, process 584 (worker) was still stuck.

🔹 4. Investigating the Stuck Process
Used:

ps -fp 584
ps -o pid,stat,comm -p 584
Output:

STAT = t
Meaning:

The process is stopped (traced) — like someone hit "pause" on it.

kill -CONT 584 didn’t help — it stayed stuck.

This happens when:

The process is waiting on a resource (like open file limit).

It's stuck in uninterruptible sleep or traced state.

🔹 5. Checked System Limits

ulimit -a
Output showed:

open files (-n): 1024
That’s low for a production server. A busy web server like Nginx needs more than that — usually around 65535.

🔹 6. Root Cause
Nginx’s worker hit the open file descriptor limit.

Couldn’t handle new connections or shutdown properly.

Even kill -9 couldn’t stop it, because it was waiting on a kernel-level resource.

🔹 7. Resolution Plan
Increase open file limit from 1024 → 65535:

Edit /etc/security/limits.conf

* soft nofile 65535
* hard nofile 65535
Edit /etc/pam.d/common-session & /etc/pam.d/common-session-noninteractive:

session required pam_limits.so
Add limits in systemd config:

File: /etc/systemd/system/nginx.service.d/override.conf

[Service]
LimitNOFILE=65535
Then:

sudo systemctl daemon-reexec
sudo systemctl restart nginx
Reboot if stuck process doesn't go away.

🔹 8. What is PAM?
PAM (Pluggable Authentication Modules) manages user authentication and session rules.

It also controls session settings like resource limits, defined in:

/etc/security/limits.conf

/etc/pam.d/common-session

🔹 9. Who suggests increasing limits?
Usually by:

Performance Monitoring Tools (e.g., Prometheus alerting file descriptor exhaustion)

DevOps Engineers after log analysis

Linux system recommendations in production setups (e.g., Nginx docs or tuning guides)

🧠 How to explain in interview:
“In one situation, I killed the Nginx master process but the service wouldn’t restart. 
The worker process was stuck even after kill -9. After analyzing with ps and journalctl, I found the worker was in a stopped state (t) likely due to hitting the file descriptor limit. 
I confirmed this with ulimit -a and raised the open file limit to 65535 using PAM and systemd overrides. This resolved the issue and Nginx restarted cleanly.”
