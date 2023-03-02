mkdir webreport
curl -o jmx.jmx "https://raw.githubusercontent.com/Afsalmc/Azure-Blob-Container-Size-Calculator/main/profileService.jmx"
apk update
apk add mutt p7zip msmtp
cat << EOF > ~/.msmtprc
defaults
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile /var/log/msmtp.log

account mailjet
host in-v3.mailjet.com
port 80
auth on
user 2ebd238a8be3d18848b277cb942d2f31
password 776a5d90525d62aa20aa69fe506036e0
from tops@carestack.com

account default : mailjet
EOF
chmod 0600 ~/.msmtprc
cat <<EOF > ~/.muttrc
set sendmail="/usr/bin/msmtp"
set use_from=yes
set from=tops@carestack.com
EOF


curl https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.7/jmeter-plugins-manager-1.7.jar >> lib/ext/jmeter-plugins-manager-1.7.jar
curl https://repo1.maven.org/maven2/kg/apc/cmdrunner/2.2/cmdrunner-2.2.jar >> lib/cmdrunner-2.2.jar
curl "https://raw.githubusercontent.com/Afsalmc/Azure-Blob-Container-Size-Calculator/main/mssql-jdbc-12.2.0.jre8.jar" >>  lib/ext/mssql-jdbc-12.jar
java -cp lib/ext/jmeter-plugins-manager-1.7.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

PluginsManagerCMD.sh install jpgc-synthesis

PluginsManagerCMD.sh install jpgc-cmd

PluginsManagerCMD.sh install-for-jmx jmx.jmx


echo "CookieManager.save.cookies=true" >> bin/user.properties
