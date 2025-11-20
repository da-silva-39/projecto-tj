FROM tomcat:9.0-jdk11
COPY ./publicadores-tj.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh", "run"]

