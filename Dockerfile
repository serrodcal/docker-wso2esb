FROM isim/oraclejava:1.8.0_101

ARG ESB_VERSION=${VERSION:-5.0.0}
ARG VCS_REF

RUN wget -P /opt https://s3-us-west-2.amazonaws.com/wso2-stratos/wso2esb-${ESB_VERSION}.zip && \
    apt-get update && \
    apt-get install -y zip && \
    apt-get install -y vim && \
    apt-get clean && \
    unzip /opt/wso2esb-${ESB_VERSION}.zip -d /opt && \
    rm /opt/wso2esb-${ESB_VERSION}.zip && \
    mkdir /opt/artifacts

COPY bin/wso2server.sh /opt/wso2esb-5.0.0/bin/wso2server.sh
COPY artifacts/* /opt/artifacts/
COPY dropins/* /opt/wso2esb-5.0.0/repository/components/dropins/

EXPOSE 9443:9443 9763:9763 8243:8243 8280:8280 19444:19444
WORKDIR /opt/wso2esb-${ESB_VERSION}
ENTRYPOINT ["bin/wso2server.sh"]
