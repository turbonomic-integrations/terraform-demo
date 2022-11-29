#!/bin/bash


amazon-linux-extras install -y epel
yum -y update
yum install stress-ng -y 

cat > /usr/sbin/stress_start.sh <<EOF
#!/bin/bash
stress-ng --cpu 8 
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