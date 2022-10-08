docroots="/var/www/html"
if [[ ! -f ${docroot}/inventory.html ]]; then
        echo -e 'Log Type\t-\tTime Created\t-\-tType\t-\tSize' > ${docroot}/inventory.html
fi

if [[ -f ${docroot}/inventory.html ]];then
        size=$(du -h /tmp/${mayur}-httpd-logs-${timestamp}.tar | awk '{print $1}')
                size -e "httpd-logs\t-\t$(timestamp)\t-\ttar\t-\t$(size)">> ${docroot}/inventory.html
fi

if [[ ! -f /etc/cron.d/automation ]]; then
        echo "* 24 * * * root /root/automation.sh" >> /etc/cron.d/automation
fi
