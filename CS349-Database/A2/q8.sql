SELECT DISTINCT cnum, term, total FROM ( \
	SELECT cnum, term, count(snum) as total \
	,CASE \
	WHEN substring(term,1,1) = 'W' THEN 1 \
	WHEN substring(term,1,1) = 'S' THEN 2 \
	WHEN substring(term,1,1) = 'F' THEN 3 \
	END  as sorter \
	FROM enrollment \
	WHERE cnum NOT IN \
		(SELECT cnum FROM class WHERE pnum IN \
		(SELECT pnum FROM professor WHERE dept ='CS' OR dept='CO')) \
	GROUP BY cnum, term \
	ORDER BY substring(term,2,2) asc, sorter)

