
FROM busybox as fetcher
WORKDIR /appscan
ADD https://cloud.appscan.com/eu/api/SCX/StaticAnalyzer/SAClientUtil?os=linux /tmp/SAClientUtil.zip
RUN unzip /tmp/SAClientUtil.zip -d /appscan \
 && mv SAClientUtil* SAClientUtil

FROM ubuntu:20.04
COPY --from=fetcher /appscan/ /appscan/
ENV PATH $PATH:/appscan/SAClientUtil/bin
