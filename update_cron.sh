#!/bin/bash


        for SERVER in `ssh -t -q stargate "cat lists/vladp_list" | sed -s 's/\r//'`; do
                echo "Updating ${SERVER}"
                scp /home/vladp/autoupdate.py $SERVER:/root/setup
                ssh $SERVER "echo -e '\n#Softaculous autoupdate\n10 23 * * Sat python /root/setup/autoupdate.py > /dev/null 2>&1\n' >> /var/spool/cron/root"
        done


exit 0
