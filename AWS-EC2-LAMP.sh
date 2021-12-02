# Setting up Apache Web Server or LAMP to host your dynamic website on EC2 Instance
# First offload your .zip file to an S3 bucket
# Make your bucket objects public
# Create your EC2 instance and make sure you configure ports 80 + 443 HTTP + HTTPS for both IPv4 and IPv6, as well as SSH (port 22)
# SSH into instance (I used EC2 Instance Connect)
# After running below commands, navigate to public IP for your EC2 instance and you should see your website! :)

sudo su #root
yum update -y #update packages 
yum install httpd -y #install Apache web server
#If you need to install more dependencies, like PHP or MySQL ...
yum install -y httpd mariadb-server
#Or if you prefer MySQL
wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
cd /var/www/html/
wget <insert S3 object URL here>
unzip <insert folder path>
mv <folder name>/* .
service httpd start