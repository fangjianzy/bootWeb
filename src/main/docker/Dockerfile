FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD tms-admin-service-1.0.2.jar tms-admin-service.jar
ENV TZ=Asia/Shanghai
RUN sh -c 'touch /tms-admin-service.jar && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone'
ENV JAVA_OPTS=""
EXPOSE 7058
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /tms-admin-service.jar -Xms256m -Xmx1024m --spring.profiles.active=prod" ]