echo installing mongodb

#
### Install MongoDB Manual Steps.
#
#Ref URL: [https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/)
#
#1. Setup MongoDB repos.
#
#```bash
#curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo
#```
#
#1. Install Mongo & Start Service.
#
#```bash
## yum install -y mongodb-org
## systemctl enable mongod
## systemctl start mongod
#
#```
#
#1. Update Listen IP address from 127.0.0.1 to 0.0.0.0 in config file
#
#Config file: `/etc/mongod.conf`
#
#then restart the service
#
#```bash
## systemctl restart mongod
#
#```
#
### Every Database needs the schema to be loaded for the application to work.
#
#Download the schema and load it.
#
#```
## curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"
#
## cd /tmp
## unzip mongodb.zip
## cd mongodb-main
## mongo < catalogue.js
## mongo < users.js
#
#```
#
#Symbol `<` will take the input from a file and give that input to the command.

source components/common.sh


echo "installing mongodb repo file"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG_FILE
STAT $?

echo "install mongodb"
yum install -y mongodb-org &>>$LOG_FILE
STAT $?

echo "update mongodb config file"
sed -i -e 's/127.0.0.1/0.0.0.0/' etc/mongod.conf  &>>$LOG_FILE
STAT $?

echo "start Database"
systemctl enable mongod &>>$LOG_FILE
systemctl start mongod &>>$LOG_FILE
STAT $?

echo "download schema"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>$LOG_FILE

echo "extract schema"
cd /tmp/
unzip -o mongodb.zip &>>$LOG_FILE
STAT $?

echo "load schema"
cd mongodb-main
 mongo < catalogue.js &>>$LOG_FILE
 mongo < users.js &>>$LOG_FILE
STAT $?





