# Update-Dtdns

Command-line program to update dynamic IP with https://www.dtdns.com service.

- [DESCRIPTION](#description)
- [INSTALLATION](#installation)
- [AUTO UPDATE](#auto-update)

### DESCRIPTION
**update-dtdns.sh** is a very minimal shell commande-line program to update dynamic IP with https://www.dtdns.com service.
It works on linux systems and uses only 4 commands
 - wget
 - nslookup
 - tail
 - awk

The public IP is provided by http://myip.dtdns.com

No other external ressources are needed.

The dtdns.com update specs are fully respected

https://www.dtdns.com/dtsite/updatespec


### INSTALLATION
Download the script

    sudo wget https://raw.github.com/WassimAttar/update-dtdns/master/update-dtdns.sh -O /usr/bin/update-dtdns.sh
    sudo chmod +x /usr/bin/update-dtdns.sh

Edit the file to enter your dtdns.com credentials

    HOSTNAME : johndoe.dtdns.net
    PASSWORD : azerty
    sudo nano /usr/bin/update-dtdns.sh

Launch the update :

    update-dtdns.sh

Output :

    Change from xxx.xxx.xxx.xxx to yyy.yyy.yyy.yyy
    dtdns.com response : Host johndoe.dtdns.net now points to yyy.yyy.yyy.yyy.

### AUTO UPDATE

Edit Crontab to check hourly.

No need to be root.

    crontab -e
    0 * * * * /usr/bin/update-dtdns.sh > /dev/null 2>&1