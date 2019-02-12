REGISTER /usr/local/hadoop/share/hadoop/common/lib/jts-1.8.jar
REGISTER /usr/local/hadoop/share/hadoop/common/lib/pigeon-0.2.0.jar
REGISTER /usr/local/hadoop/share/hadoop/common/lib/esri-geometry-api-1.2.jar

IMPORT 'pigeon_import.pig';

points = LOAD 'dados/points.txt' USING PigStorage(',') AS (id:long, lon:double, lat:double);
s_points = FOREACH points GENERATE ST_MakePoint(lat, lon) AS point,id;
points_by_id = ORDER s_points BY id;

result = FOREACH points_by_id GENERATE ST_AsText(point);

STORE result INTO 'resultadopig/resultspigeondois';

