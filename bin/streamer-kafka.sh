#!/usr/bin/env bash

if [ $# -lt 1 ];
then
    echo "USAGE: $0 <bootstrap_kafka_server> <cep_instance_id> [stream_config_path]"
    exit 1
fi

CURRENT=`pwd` && cd `dirname $0` && SOURCE=`pwd` && cd ${CURRENT} && PARENT=`dirname ${SOURCE}`

for file in ${PARENT}/lib/*.jar;
do
    CLASSPATH="$CLASSPATH":"$file"
done

if [ $# -eq 2 ]; then
  java ${JVM_OPTIONS} -cp ${CLASSPATH} io.wizzie.ks.cep.utils.bootstrap.StreamerKafkaConfig $1 $2
elif [ $# -eq 3 ]; then
  java ${JVM_OPTIONS} -cp ${CLASSPATH} io.wizzie.ks.cep.utils.bootstrap.StreamerKafkaConfig $1 $2 $3
fi