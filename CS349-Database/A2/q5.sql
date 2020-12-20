SELECT distinct snum,sname FROM student WHERE year > 1 \
AND snum NOT IN \
	(SELECT snum FROM mark WHERE grade >  70) \
AND snum NOT IN \
(SELECT e.snum FROM enrollment e INNER JOIN \
	(SELECT * FROM class WHERE pnum IN \
		(SELECT pnum FROM professor WHERE dept = 'PH')) as q1 \
ON e.cnum=q1.cnum AND e.term=q1.term AND e.section=q1.section)

