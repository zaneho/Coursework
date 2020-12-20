SELECT distinct s.snum, s.sname FROM student s INNER JOIN mark m ON s.snum=m.snum \
WHERE s.year>2 \
 AND s.snum NOT IN (SELECT snum from mark where m.cnum LIKE  'CS%' AND m.grade < 85) \
AND s.snum NOT IN \
(SELECT unique snum from enrollment e INNER JOIN \
(SELECT * from class where pnum in (SELECT pnum from professor WHERE dept!='CS')) as q1 \
ON e.cnum=q1.cnum AND e.term=q1.term AND e.section=q1.section )

