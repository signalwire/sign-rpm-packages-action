FROM --platform=linux/amd64 centos:7.9.2009

RUN mkdir /data
WORKDIR /data

RUN yum install -y rpm-build rpmdevtools rpm-sign createrepo expect
COPY script.sh script.sh
COPY passphrase.expect passphrase.expect
RUN chmod +x script.sh
CMD ["sh", "/data/script.sh"]

