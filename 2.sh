#systemctl start confluent-zookeeper
#sleep 10
##systemctl start confluent-kafka
#sleep 10
systemctl start confluent-control-center
sleep 10
systemctl start confluent-schema-registry
systemctl start confluent-kafka-rest
systemctl start confluent-ksql
sleep 1000
# testing Branches
# Add line for QA
#Add line for f/d
#added line 2
systemctl start confluent-kafka-connect
