#**1.  Install Redis**
#
#Install Redis on CentOS-7
#
#```bash
#
## curl -L https://raw.githubusercontent.com/roboshop-devops-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo
## yum install redis-6.2.7 -y
#```
#
#Install Redis on CentOS-8
#
#```bash
## dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
## dnf module enable redis:remi-6.2 -y
## yum install redis -y
#```
#
#2. Update the `bind` from `127.0.0.1` to `0.0.0.0` in config file `/etc/redis.conf` & `/etc/redis/redis.conf`
#
#3. Start Redis Database
#
#```bash
## systemctl enable redis
## systemctl start redis
##``
source components/common.sh
echo "configuring Repo"
curl -L https://raw.githubusercontent.com/roboshop-devops-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo  &>>$LOG_FILE
STAT $?

echo "Install Redis"
yum install redis-6.2.7 -y &>>$LOG_FILE
STAT $?

echo "Update redis configuration"
if [ -f /etc/redis.conf ]; then
sed -i -e "s/120.0.0.1/0.0.0.0/g" /etc/redis.conf &>>$LOG_FILE
elif [ -f /etc/redis/redis.conf ]; then
  sed -i -e "s/120.0.0.1/0.0.0.0/g" /etc/redis.conf &>>$LOG_FILE
  fi
STAT $?

echo "Start Redis"
systemctl enable redis
systemctl start redis &>>$LOG_FILE
STAT $?








