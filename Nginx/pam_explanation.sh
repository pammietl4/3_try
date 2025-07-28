🧩 What is PAM?
PAM stands for Pluggable Authentication Modules.

It’s a Linux system framework that manages authentication and authorization — basically who can log in, what rules apply, and what resources they can use.

Think of it as a gatekeeper for user sessions.

🧰 Why is PAM important for ulimit?
When you increase limits like:

ulimit -n 65535
…you often want that change to persist when:

A user logs in (SSH, su, etc.)

A service like Nginx is started

But by default, Linux may ignore those limits unless PAM is configured to enforce them.

✅ What does “Enabled limits in PAM config” mean?
It means the system is configured to obey the limits (like open files, memory, etc.) set in:

/etc/security/limits.conf

/etc/security/limits.d/*.conf

And this is enabled by editing a PAM config file, typically:


/etc/pam.d/common-session
Or:


/etc/pam.d/common-session-noninteractive
And adding this line (if not already present):

session required pam_limits.so
🧑‍💻 As a DevOps Engineer, why should I care?
Because if this line is missing, even if you set high limits in /etc/security/limits.conf, they won’t take effect for users or services.

Symptoms of missing PAM limits:

Nginx fails even after you set limits

A service hits the default 1024 file limit

ulimit -n shows 65535 only in shell, but not for systemd services

🗣️ Interview Tip:
If asked about ulimit and PAM, say:

"I made sure to enable pam_limits.
so in the PAM session configuration so that user and service limits defined in /etc/security/limits.conf are applied system-wide, especially for SSH sessions and interactive logins."

