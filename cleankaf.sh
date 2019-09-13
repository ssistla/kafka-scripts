ansible preflight -m shell -a "yum remove -y confluent*"
ansible preflight -m shell -a "rm -fr /etc/*kafka* /etc/*conflue* /var/lib/zookeeper /var/lib/kafka  /var/lib/confluent /var/log/kafka/* /var/log/confluent/* /var/ssl/private/*"
