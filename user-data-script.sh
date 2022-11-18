#!/bin/bash

dnf config-manager --set-enabled crb
dnf install epel-release epel-next-release -y
dnf check-update
# dnf upgrade -y
dnf install stress -y 

cat > /usr/sbin/stress_start.sh <<EOF
#!/bin/bash
stress --cpu 8 
EOF

cat > /etc/systemd/system/stress.service <<EOF
[Unit]
Description='Run stress command as a service'

[Service]
ExecStart=/bin/bash /usr/sbin/stress_start.sh

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload

systemctl enable --now stress.service