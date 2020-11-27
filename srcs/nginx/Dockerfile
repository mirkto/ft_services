# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ngonzo <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/16 17:39:09 by ngonzo            #+#    #+#              #
#    Updated: 2020/11/16 17:39:10 by ngonzo           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update && apk add openrc \
		nginx \
		supervisor \
		openssl \
		openssh

RUN		adduser -D 'ngonzo'; echo "ngonzo:asda" | chpasswd;

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj '/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=ngonzo' \
		-keyout /etc/ssl/localhost.key \
		-out /etc/ssl/localhost.crt

RUN		mkdir www

COPY	./srcs/index.html \
		./srcs/style.css \
		./srcs/bg.jpg \
		/www/

COPY	./srcs/nginx.conf \
		/etc/nginx/conf.d/default.conf

COPY	./srcs/supervisord.conf \
		/etc/supervisord.conf

COPY	./srcs/start.sh \
		start.sh

RUN		chmod 711 start.sh

EXPOSE	80 443 22

CMD		[ "sh", "start.sh" ]
