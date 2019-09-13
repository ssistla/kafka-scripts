systemctl $1 confluent-zookeeper
sleep 10
systemctl $1 confluent-kafka
sleep 10
systemctl $1 confluent-control-center
sleep 10
systemctl $1 confluent-schema-registry
systemctl $1 confluent-kafka-rest
systemctl $1 confluent-ksql
sleep 10
systemctl $1 confluent-kafka-connect
