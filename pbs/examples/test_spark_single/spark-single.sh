#!/bin/bash
#PBS -l nodes=1:ppn=4,walltime=0:20:00
#PBS -l pmem=2gb
#PBS -N spark-wordcount
#PBS -q test

# -l nodes must be equal 1
# -l pmem set the maximum memory for spark worker process 

export SPARK_HOME=$HOME/spark-1.4.1-bin-1.2.1  

#Manually define PBS_NUM_PPN as same as ppn=xx,
# since it doesn't define in torque 2.3.7
PBS_NUM_PPN=4

#Manually set how much memory allocated to each spark worker/driver.
#It must be equal to PBS -l pmem=xx but do not use "mb" or "gb"
SPARK_MEM="2g"   # just m, M, g or G 

$SPARK_HOME/bin/spark-submit --master local[$PBS_NUM_PPN] --class JavaWordCount  --driver-memory $SPARK_MEM $PBS_O_WORKDIR/testjwc.jar file:///etc/services > $PBS_O_WORKDIR/wc.txt


