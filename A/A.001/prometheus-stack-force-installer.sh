#!/usr/bin/env bash

helm uninstall -n monitoring prometheus > /dev/null 2>&1
helm uninstall -n monitoring prometheus-stack > /dev/null 2>&1
kubectl -n monitoring delete pvc prometheus-prometheus-stack-kube-prom-prometheus-db-prometheus-prometheus-stack-kube-prom-prometheus-0 > /dev/null 2>&1
echo "Delete all prometheus components successfully!"

echo "Start to deploy prometheus operator with scraping 15s interval"
echo "=============================================================="
sh ~/_Lecture_prom_learning.kit/ch8/8.2/prometheus-stack-installer-15s.sh
