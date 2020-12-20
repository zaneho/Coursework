SELECT DISTINCT s.snum, s.sname \
FROM student s \
RIGHT JOIN ( \
	(SELECT snum FROM MARK \
	WHERE cnum='CS245' AND grade>84) \
	INTERSECT \
	(SELECT snum FROM MARK \
	WHERE cnum='CS240' AND grade>84)) AS q1 \
ON s.snum=q1.snum \
WHERE s.year>2
