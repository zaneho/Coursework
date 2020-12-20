SELECT distinct cnum, term, count(snum) as numstudents \
FROM enrollment WHERE cnum NOT IN ( \
SELECT cnum FROM class WHERE pnum IN \
	(SELECT pnum FROM professor WHERE dept ='CS' OR dept='AM')) \
GROUP BY cnum, term \
ORDER BY numstudents desc

