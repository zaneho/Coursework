SELECT s.snum, s.sname, q1.avgcs as avgcs, q2.avgall as avgall \
, (q3.countCS * 100 / q4.countAll) as percentage \
FROM student s \
	FULL OUTER JOIN \
	(SELECT snum, avg(grade) as avgcs FROM mark WHERE cnum LIKE 'CS%' \
	GROUP BY snum) as q1 ON s.snum=q1.snum FULL OUTER JOIN \
	(SELECT snum, avg(grade) as avgall FROM mark \
	GROUP BY snum) as q2 ON s.snum=q2.snum FULL OUTER JOIN \
	(SELECT snum, count(cnum) as countCS FROM enrollment WHERE cnum LIKE 'CS%' \
	GROUP BY snum) as q3 ON s.snum=q3.snum FULL OUTER JOIN \
	(SELECT snum, count(cnum) as countAll FROM enrollment \
	GROUP BY snum) as q4 ON s.snum=q4.snum \
WHERE s.year=4 \
ORDER BY avgcs desc, percentage desc

