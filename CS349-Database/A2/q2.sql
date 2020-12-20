SELECT distinct c.pnum, p.pname from CLASS c INNER JOIN professor p ON p.pnum=c.pnum \
WHERE c.cnum='CS245' \
AND c.pnum NOT IN ( \
	SELECT DISTINCT c.pnum \
	FROM class c INNER JOIN mark m \
	ON c.cnum=m.cnum AND c.term=m.term AND c.section=m.section \	
	WHERE c.cnum='CS245') \
AND c.pnum IN ( \
	SELECT pnum FROM PROFESSOR WHERE dept  !='PM' )

