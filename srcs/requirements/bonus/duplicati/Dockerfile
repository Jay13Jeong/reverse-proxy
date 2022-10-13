FROM debian:buster-slim

# RUN apt-get update
# RUN apt-get install wget -y
# RUN wget https://updates.duplicati.com/beta/duplicati_2.0.6.3-1_all.deb
# RUN apt-get install ./duplicati_2.0.6.3-1_all.deb -y
# ENTRYPOINT [ "duplicati-server", "--webservice-interface=127.0.0.1" ]

# RUN apt install nginx -y
# echo "proxy_set_header X-Real-IP $remote_addr; proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; } }" > /etc/nginx/conf.d/duplicati.conf

# RUN apt-get update && apt-get install -y mono-devel jq unzip \
# && if [ -z ${DUPLICATI_RELEASE+x} ];\
# then DUPLICATI_RELEASE=$(curl -sX GET "https://api.github.com/repos/duplicati/duplicati/releases" \
# | jq -r 'first(.[] | select(.tag_name | contains("beta"))) | .tag_name');\
# fi && mkdir -p /app/duplicati && duplicati_url=$(curl -s https://api.github.com/repos/duplicati/duplicati/releases/tags/"${DUPLICATI_RELEASE}"\
# |jq -r '.assets[].browser_download_url' |grep '.zip$' |grep -v signatures) \
# && curl -o /tmp/duplicati.zip -L "${duplicati_url}" && unzip -q /tmp/duplicati.zip -d /app/duplicati \
# && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# ENTRYPOINT [ "/init" ]

ENTRYPOINT [ "yes" ]
