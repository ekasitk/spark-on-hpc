#!/bin/bash

# Import several spark variables
source $SPARK_HOME/sbin/spark-on-hpc.sh vars

SPARK_URL=spark://$SPARK_MASTER_IP:$SPARK_MASTER_PORT
WEBUI_URL=http://$SPARK_MASTER_IP:$SPARK_MASTER_WEBUI_PORT

class=$1
jar=$2
shift
shift

now=$(date +"%m_%d_%Y_%H_%M_%S")

# Submit a spark job. 
# The driver and executor memory is defined from -l vmem

$SPARK_HOME/bin/spark-submit \
  --class $class \
  --master $SPARK_URL \
  $jar  \
  $@ >> $SPARK_JOB_DIR/log-$now.log 2>&1



