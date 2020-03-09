#!/bin/bash

fails=('Ops...' 'Hum...' 'Eita...' 'Olha...' 'Veja bem...')
successes=('Parabéns!' 'Muito bom!' 'Isso!' 'Show!' 'Ae!')

function echo_fail {
	echo -e "\033[0;31m${fails[$(($RANDOM % 5))]} $1\033[0m"
	exit 1
}

function echo_success {
	echo -e "\033[0;32m${successes[$(($RANDOM % 5))]} $1\033[0m"
}

echo 'Task 1 - Verificando cluster...'
test ! -x /usr/bin/kubectl &&  echo_fail 'não conseguimos executar o comando kubectl.'
test "3" -ne "$(kubectl get nodes --no-headers | grep -wi ready | wc -l)" &&  echo_fail 'nem todos os três estão respondendo.'
echo_success 'Os três nodes estão respondendo!\n'

echo 'Task 2 - Pod chamado apache...'
kubectl -n default describe pod apache > /tmp/task1
test -z "$(cat /tmp/task1)" && echo_fail 'não conseguimos encontrar um pod chamado "apache".'
grep -E 'Status: *Running' /tmp/task1
test "0" -ne "$?" && echo_fail 'o pod parece não estar rodando.'
grep -E 'Image:.* httpd:alpine' /tmp/task1 > /dev/null
test "0" -ne "$?" && echo_fail 'a imagem do pod não é httpd:alpine.'
echo_success 'O pod está configurado corretamente!\n'
