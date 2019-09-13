systemctl stop confluent-kafka-connect
systemctl stop confluent-ksql
systemctl stop confluent-kafka-rest
systemctl stop confluent-schema-registry
systemctl stop confluent-control-center
sleep 10
systemctl stop confluent-kafka
sleep 10
systemctl stop confluent-zookeeper
