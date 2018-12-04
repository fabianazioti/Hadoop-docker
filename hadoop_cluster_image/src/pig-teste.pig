points = LOAD 'hdfs://hadoop-master:9000/user/root/dados/points.txt' USING PigStorage(',') AS (id:long, lon:double, lat:double);

DUMP points;

results = FILTER points BY
  lon < -93.158 AND lon > -93.175 AND
  lat > 45.0077 AND lat < 45.0164;
  
STORE results INTO 'resultadopig/results';

