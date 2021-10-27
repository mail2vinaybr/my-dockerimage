FROM maven:3.8.3-openjdk-8-slim AS maven
RUN mkdir /usr/src/mymaven
WORKDIR /usr/src/mymaven
COPY . .
RUN mvn clean install

FROM vinaybr07/mytest:tomcat9.0
COPY --from=maven /usr/src/mymaven/target/*.jar /opt/tomcat/webapps/
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh","run"]
