FROM ubuntu

RUN apt-get update && apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl openssh-server ca-certificates
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postfix

RUN DEBIAN_FRONTEND=noninteractive curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh |  bash

RUN DEBIAN_FRONTEND=noninteractive apt-get install tzdata -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install gitlab-ce

EXPOSE 443 2710 80

WORKDIR /etc/gitlab

RUN sed -i 's/http:\/\/gitlab.example.com/https:\/\/192.168.99.100/g' gitlab.rb
RUN echo "gitlab_rails['gitlab_shell_ssh_port'] = 2710" >> gitlab.rb
RUN echo "letsencrypt['enable'] = true" >> /etc/gitlab/gitlab.rb
RUN echo "nginx['redirect_http_to_https_port'] = 80" >> /etc/gitlab/gitlab.rb
RUN echo "nginx['redirect_http_to_https'] = true" >> /etc/gitlab/gitlab.rb

RUN echo "Port 2710" >> /etc/ssh/ssh_config

RUN echo "/opt/gitlab/embedded/bin/runsvdir-start& gitlab-ctl reconfigure" > op.sh
RUN echo "service ssh restart" >> op.sh
RUN echo "tail -f /dev/null" >> op.sh

RUN chmod 777 op.sh

CMD ["sh", "op.sh"]
#docker build -t gitlab .
#docker run -it --privileged -p 443:443 -p 80:80 -p 2710:22 gitlab

#Cloning HTTPS:
#env GIT_SSL_NO_VERIFY=true git clone (https link)

#Cloning SSH:
#Add the pub key to the gitlab server
#ssh -T -i private-key -p port git@ipaddress
#env GIT_SSH_COMMAND='ssh -i private_key -p port' git clone (ssh link)
