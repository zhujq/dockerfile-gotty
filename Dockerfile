FROM ubuntu:16.04

EXPOSE 8080

RUN apt-get -y update && apt-get install -y curl  zip unzip net-tools inetutils-ping iproute2  \  
&& curl -sLk https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz | tar xzC /usr/local/bin \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/local/bin/gotty"]
CMD ["--permit-write","--reconnect","/bin/bash"]
