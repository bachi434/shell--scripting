source components/common.sh



echo "Installing Nginx"
yum install nginx -y &>>$LOG_FILE

STAT $?



echo "downloading frontend content"
 curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG_FILE
STAT $?

echo "clean old content"
rm -rf /usr/share/nginx/html/*  &>>$LOG_FILE
STAT $?

echo "extract frontend content"
cd /tmp
unzip -o frontend.zip  &>>$LOG_FILE
STAT $?

echo "copy extracted content to Nginx file"
cp -r frontend-main/static/* /usr/share/nginx/html/ &>>$LOG_FILE
STAT $?

echo "copy Nginx roboshop config"
cp frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG_FILE
STAT $?

echo "start Nginx service"

systemctl enable nginx &>>$LOG_FILE
systemctl start nginx &>>$LOG_FILE
STAT $?











