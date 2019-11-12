/*
A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
*/

SET @INDEX_ = 0;
SELECT ROUND(T.LN, 4)
FROM (
  SELECT @INDEX_ := @INDEX_ + 1 AS INDEX_, LAT_N AS LN
  FROM STATION
  ORDER BY LAT_N ASC
    ) AS T
WHERE T.INDEX_ = CEILING(@INDEX_/ 2);
