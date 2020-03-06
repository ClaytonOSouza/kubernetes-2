#!/bin/bash

# ATENÇÃO: A execução deste script cria parte do cenário de testes.
# Se deseja aprender a resolver problemas do cluster não leia este arquivo
# antes de tentar resolver o problema de comunicação entre os nós.

if [ "$HOST" == 'master']; then
	sed -i 's,/etc/kubernetes/manifests,/etc/kubernete/manifest,' /var/lib/kubelet/config.yaml
	systemctl daemon-reload
	systemctl restart kubelet
fi

if [ "$HOST" == 'node1' ]; then
	systemctl stop kubelet
	systemctl daemon-reload
	rm -rf /lib/systemd/system/kubelet.service
fi

if [ "$HOST" == 'node2' ]; then
	sed -i 's/systemd/cgroupfs/' /var/lib/kubelet/kubeadm-flags.env
	systemctl daemon-reload
	systemctl restart kubelet
fi
