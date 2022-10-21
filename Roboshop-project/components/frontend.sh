echo installing frontend


LOG_FILE=/tmp/roboshop.log
rm -f $LOG_FILE



echo "Installing Nginx"
yum install nginx -y &>>$LOG_FILE



echo "downloading frontend content"
 curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG_FILE

echo "clean old content"
rm -rf /usr/share/nginx/html/*  &>>$LOG_FILE


echo "extract frontend content"
cd /tmp
unzip -o frontend.zip  &>>$LOG_FILE


echo "copy extracted content to Nginx file"
cp -r frontend-main/static/* /usr/share/nginx/html/ &>>$LOG_FILE


echo "copy Nginx roboshop config"
cp frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG_FILE

echo "start Nginx service"

systemctl enable nginx &>>$LOG_FILE
systemctl start nginx &>>$LOG_FILE










