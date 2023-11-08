#!/bin/bash
#######################
# certbot renew enrolled at cron with force option
# author : yureutae
#######################
nowdate=$(date +"%Y-%m-%d %H:%M:%S")
sudo systemctl status cron
sudo chmod +x /root/certbot-renew/certbot_cron.sh
echo "${nowdate} try enroll certbot_cron.sh at cron" >> certbot_cron_log.log
(crontab -l 2>/dev/null; echo "0 0 * * 0 /bin/bash /root/certbot-renew/certbot_cron.sh") | crontab -
sudo systemctl restart cron
sudo systemctl restart crond
sudo systemctl status cron