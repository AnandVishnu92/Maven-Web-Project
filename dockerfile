FROM tomcat9
Copy /var/lib/jenkins/workspace/newp1/target/*.war /var/lib/tomcat9/webapps
EXPOSE 8080
CMD ["catalina.sh","run"]
