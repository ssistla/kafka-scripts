openssl req -new -x509 -keyout ca-key -out ca-cert -days 7300 -subj "/C=US/ST=TX/O=MyOrg, Inc./CN=red.lan" -passin pass:confluent -passout pass:confluent
keytool -noprompt -keystore client.truststore.jks -alias CARoot -import -file ca-cert

for i in red.lan blue.lan green.lan
do
mkdir $i
cp client.truststore.jks ${i}
keytool -noprompt -keystore ${i}/client.keystore.jks -alias localhost -validity 7300 -genkey -keyalg RSA -storepass confluent -keypass confluent -dname "CN={$i},OU=test,O=test,L=Austin,ST=TX,C=US" -ext san=dns:${i}

keytool -noprompt -keystore ${i}/client.keystore.jks -alias localhost -certreq -file ${i}/cert-file

openssl x509 -req -CA ca-cert -CAkey ca-key -in ${i}/cert-file -out ${i}/cert-signed -days 7300 -CAcreateserial -passin pass:confluent 

keytool -noprompt -keystore ${i}/client.keystore.jks -alias CARoot -import -file ca-cert
keytool -noprompt -keystore ${i}/client.keystore.jks -alias localhost -import -file ${i}/cert-signed

done
#ansible preflight -m shell -a "mv /var/ssl/private /var/ssl/private_confluent_generated"
#ansible preflight -m shell -a "mkdir /var/ssl/private"

for i in red.lan blue.lan green.lan
do
scp ${i}/* ${i}:/var/ssl/private
done
