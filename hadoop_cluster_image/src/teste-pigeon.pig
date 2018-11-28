REGISTER pig/pig-0.16.0/lib/jts-1.8.jar;
REGISTER pig/pig-0.16.0/lib/pigeon-0.2.1.jar;
REGISTER pig/pig-0.16.0/lib/esri-geometry-api-1.2.1.jar;

IMPORT 'pigeon_import.pig';

points = LOAD 'hdfs://hadoop-master:9000/user/root/pigdata/points.txt' AS (id:long, lon:double, lat:double);

results = FILTER points BY
  lon < -93.158 AND lon > -93.175 AND
  lat > 45.0077 AND lat < 45.0164;
  
STORE results INTO 'results';

# vs

#points = LOAD 'hdfs://hadoop-master:9000/user/root/pigdata/points.txt' AS (id:long, l);



#results = FILTER points BY
#        ST_Contains(ST_MakeBox(-93.158, 45.0077,-93.175, 45.0164 ), location)



