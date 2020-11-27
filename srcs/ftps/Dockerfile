# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ngonzo <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/16 17:31:19 by ngonzo            #+#    #+#              #
#    Updated: 2020/11/16 17:31:24 by ngonzo           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update && apk add openrc \
		vsftpd \
		openssl

WORKDIR	/srcs

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj '/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=ngonzo' \
		-keyout /etc/ssl/private/vsftpd.key \
		-out /etc/ssl/certs/vsftpd.crt

RUN		adduser -D -h /var/ftp ngonzo; echo "ngonzo:asda" | chpasswd && \
		mkdir -p /var/ftp

COPY	/srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY	/srcs/start.sh .
RUN		chmod 711 start.sh

EXPOSE	20 21 30000

CMD		[ "sh", "start.sh" ]
