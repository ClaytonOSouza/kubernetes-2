#!/bin/bash

cat <<EOF
##########################
#       Kubernetes       #
##########################

1 - Corrigir o problema de comunicação entre as máquinas:
		1.1 - master...172.27.11.10
		1.2 - node1....172.27.11.20
		1.3 - node2....172.27.11.30
	Obs: SSH através do usuário "root" está liberado entre as máquinas citadas.

2 - Provisionar um pod chamado "apache" com a imagem "httpd:alpine" que responde na porta 8080.

3 - Criar um deployment chamado "cgi" baseado na imagem "hectorvido/sh-cgi" com um service.
	3.1 - O deployment deverá possuir 4 réplicas.
	3.2 - O pod deverá escutar na porta 9090.
	3.3 - O serviço responderá internamente através da porta 80.
	3.3 - O serviço permitirá acessar o pod externamente pela porta 30000

4 - Atualizar o deployment "cgi" para a imagem "hectorvido/sh-cgi:v2".
	4.1 - O histórico da atualização precisa estar disponível para consulta.
	4.2 - Após atualizar, faça rollback para a versão anterior.

5 - Criar um pod de "memcached:alpine" para cada "worker" do cluster.
	5.1 - Caso um novo "worker" seja adicionado ao cluster, uma réplica
	deste pod precisa automaticamente ser provisionado dentro do novo nó.

6 - 
EOF
