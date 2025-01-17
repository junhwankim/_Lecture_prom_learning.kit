# 1.install prometheus-alertmanager
./1.prometheus-alertmanager-updater.sh

# 2.deploy nginx and nginx exporter to collect nginx app metrics
kubectl apply -f 2.nginx-w-exporter

# 3.apply alert configuration for prometheus's alert trigger
kubectl patch configmap prometheus-server -n monitoring --patch-file 3.nginx-status.alerting.rules.yaml
# check alert tab(192.168.57.11) and alertmanager(192.168.57.65)

# 4.register slack receiver on alertmanager
# change slack API Address
sed -i \
's,Slack-URL,<MUST Change> https://hooks.slack.com/services/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,g' \
4.MUST-Change-alertmanager-add-slack-receivers.yaml

# apply changed slack receiver on prometheus's alertmanager
kubectl patch configmap prometheus-alertmanager -n monitoring --patch-file 4.MUST-Change-alertmanager-add-slack-receivers.yaml


# change replicas for triggering nginx alert
kubectl scale deployment nginx --replicas 0
# wait wait wait ....
# confirm message in slack channel
kubectl scale deployment nginx --replicas 3

# 5.rollback configuration to delete prometheus-alertmanager
./5.prometheus-alertmanager-rollback.sh