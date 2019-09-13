for i in client broker
do

/bin/kafka-acls --authorizer-properties zookeeper.connect=red.lan:2181 --add --allow-principal User:$i --operation All --topic '*' --group '*'
/bin/kafka-acls --authorizer-properties zookeeper.connect=red.lan:2181 --add --allow-principal User:$i --operation All --topic '*' --cluster

done
