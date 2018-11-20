#!/bin/bash
ENVIRNOMENT=$1
if [ $ENVIRNOMENT = "QA" ]; then
 for i in `cat ip.txt`
  do
   echo "deploy war file into $i "
  sleep 3
  sshpass -p "1234" scp target/ola.war anusha@$i:/home/anusha/softwares/apache-tomcat-8.5.34/webapps
  
  echo " starting tomcat server $i "
  sshpass -p "1234" ssh anusha@$i "JAVA_HOME=/home/anusha/softwares/jdk1.8.0_181 " "/home/anusha/softwares/apache-tomcat-8.5.34/bin/startup.sh"
  done
  echo " deploy success "
fi
