# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ngonzo <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/16 17:42:24 by ngonzo            #+#    #+#              #
#    Updated: 2020/11/16 17:42:26 by ngonzo           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update && apk add openrc \
		nginx supervisor \
		php7 php7-fpm php7-mysqli \ 
		php7-zlib php7-curl php7-mbstring \
		php7-json php7-session
		
RUN		mkdir www && \
		wget https://wordpress.org/latest.zip && \
		unzip latest.zip && \
		mv wordpress /www/ && \
		rm latest.zip && \
		chmod 777 -R /www

COPY	./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY	./srcs/supervisord.conf /etc/supervisord.conf
COPY	./srcs/wp-config.php /www/
COPY	./srcs/start.sh ./
RUN		chmod 711 start.sh

EXPOSE	5050

CMD		[ "sh", "start.sh" ]
