# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ngonzo <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/16 17:37:12 by ngonzo            #+#    #+#              #
#    Updated: 2020/11/16 17:37:15 by ngonzo           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update && apk add openrc \
		mysql mysql-client && \
		mkdir "/run/mysqld" && \
		chown -R mysql /run/mysqld

COPY	./srcs/createdb.sql \
		./srcs/ngonzo.sql \
		./srcs/start.sh ./
COPY	./srcs/my.cnf /etc/my.cnf

EXPOSE	3306

CMD		[ "sh", "start.sh" ]
