<VirtualHost *:80>
ServerName      www.manolodelcos.com
ServerAlias     manolodelcos.com
ServerAdmin     me@manolodelcos.com
ServerSignature email
DocumentRoot    /var/www/manolodelcos.com/web
<Directory /var/www/manolodelcos.com/web>
    Options -Indexes
</Directory>
#CustomLog       logs/manolodelcos.com.access.log combined
#ErrorLog        logs/manolodelcos.com.error.log
</VirtualHost>
