SELECT distinct pnum, pname FROM professor WHERE pnum in \
(SELECT pnum from class c INNER JOIN \
(SELECT m.cnum, m.term, m.section, count(m.snum) as NumHighestStudent \
FROM mark m INNER JOIN \
	(SELECT cnum,term,section, max(grade) as MaxGrade, \
	min(grade) as MinGrade \
	FROM mark \
	WHERE cnum='CS245' GROUP BY cnum, term, section \
	) q1 \
ON m.cnum=q1.cnum AND m.term=q1.term AND m.section=q1.section \
WHERE m.grade=MaxGrade AND MaxGrade-MinGrade <= 20 \
GROUP BY m.cnum,m.term,m.section \
HAVING count(m.snum) = 3) q2 \
ON c.cnum=q2.cnum AND c.term=q2.term AND c.section=q2.section)

