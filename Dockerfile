FROM tomcat:8
COPY target/springmvc.war /usr/local/tomcat/webapps/
