source components/common.sh



echo "Installing Nginx"
yum install nginxx -y &>>$LOG_FILE

if [ $? -eq 0 ]; then

  echo -e "\e[1;31m SUCCESS\e[0m"
  else
  echo -e "\e[1;31m FAILED\e[0m"
  exit

  fi



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










