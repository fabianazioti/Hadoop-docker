points = LOAD 'hdfs://hadoop-master:9000/user/root/pigdata/points.txt' USING PigStorage(',') AS (id:int, f2:int, f3:int);
DUMP points;

STORE points INTO 'data-points-out';

