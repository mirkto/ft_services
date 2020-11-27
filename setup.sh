minikube start --vm-driver=virtualbox # --memory=6144 --cpus=4
minikube dashboard &
eval $(minikube -p minikube docker-env) # Connects docker to work inside the cluster

# add metallb in minikube
minikube addons enable metallb # minikube addons list
# builds containers
docker build -t nginx ./srcs/nginx/				# nginx
docker build -t mysql ./srcs/mysql/				# mysql
docker build -t wordpress ./srcs/wordpress/		# wordpress
docker build -t phpmyadmin ./srcs/phpmyadmin/	# phpmyadmin
docker build -t influxdb ./srcs/influxdb		# influxdb
docker build -t telegraf ./srcs/telegraf		# telegraf
docker build -t grafana ./srcs/grafana			# grafana
docker build -t ftps ./srcs/ftps				# ftps

# apply rules
kubectl apply -f ./srcs/metallb.yaml							# metallb
kubectl apply -f ./srcs/nginx/nginx-service.yaml				# nginx
kubectl apply -f ./srcs/nginx/nginx-deployment.yaml				# /
kubectl apply -f ./srcs/mysql/mysql-volume.yaml					# mysql
kubectl apply -f ./srcs/mysql/mysql-deployment.yaml				# |
kubectl apply -f ./srcs/mysql/mysql-service.yaml				# /
kubectl apply -f ./srcs/wordpress/wordpress-deployment.yaml		# wordpress
kubectl apply -f ./srcs/wordpress/wordpress-service.yaml		# /
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin-deployment.yaml	# phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin-service.yaml		# /
kubectl apply -f ./srcs/influxdb/influxdb-volume.yaml			# influxdb
kubectl apply -f ./srcs/influxdb/influxdb-configmap.yaml		# |
kubectl apply -f ./srcs/influxdb/influxdb-deployment.yaml		# |
kubectl apply -f ./srcs/influxdb/influxdb-service.yaml			# /
kubectl apply -f ./srcs/telegraf/telegraf.yaml					# telegraf
kubectl apply -f ./srcs/grafana/grafana-deployment.yaml			# grafana
kubectl apply -f ./srcs/grafana/grafana-service.yaml			# /
kubectl apply -f ./srcs/ftps/ftps-deployment.yaml				# ftps
kubectl apply -f ./srcs/ftps/ftps-service.yaml					# /

open http://192.168.99.201

# for check
# kubectl exec deploy/ftps -- pkill vsftpd
# kubectl exec deploy/grafana -- pkill grafana
# kubectl exec deploy/telegraf -- pkill telegraf
# kubectl exec deploy/influxdb -- pkill influx
# kubectl exec deploy/mysql -- pkill /usr/bin/mysqld

# kubectl exec deploy/wordpress -- pkill nginx
# kubectl exec deploy/wordpress -- pkill php-fpm7

# kubectl exec deploy/phpmyadmin -- pkill nginx
# kubectl exec deploy/phpmyadmin -- pkill php-fpm7

# kubectl exec deploy/nginx -- pkill nginx
# kubectl exec deploy/nginx -- pkill sshd