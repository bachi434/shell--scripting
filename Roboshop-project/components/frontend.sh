echo installing frontend

#The frontend is the service in RobotShop to serve the web content over Nginx.
#
#To Install Nginx.
#
#```
## yum install nginx -y
## systemctl enable nginx
## systemctl start nginx
#
#```
#
#Let's download the HTDOCS content and deploy under the Nginx path.
#
#```
## curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
#
#```
#
#Deploy the downloaded content in Nginx Default Location.
#
#```
## cd /usr/share/nginx/html
## rm -rf *
## unzip /tmp/frontend.zip
## mv frontend-main/static/* .
## mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf
#
#```
#
#Finally restart the service once to effect the changes.

rm -f /tmp/roboshop.log

echo "Installing Nginx"
yum install nginx -y >>/tmp/roboshop.log

echo "downloading frontend content"
 curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" >>/tmp/roboshop.log

echo "clean old content"
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log

echo "extract frontend content"
unzip -o /tmp/frontend.zip &>>/tmp/roboshop.log


echo "copy extracted content to Nginx file"
mv frontend-main/static/*
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>/tmp/roboshop.log



echo "start Nginx service"
syastemctl enable nginx &>>/tmp/roboshop.log
sysytemctl start nginx &>>/tmp/roboshop.log









