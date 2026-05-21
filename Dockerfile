FROM tomcat:9-jdk17

COPY target/resume-builder.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080