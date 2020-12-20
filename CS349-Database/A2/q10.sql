SELECT 100 - (count(pnum)*100 / (select count(pnum) FROM professor)) as percent \
FROM professor \
WHERE pnum IN ( \
	SELECT pnum FROM \
	( \
		SELECT pnum, cnum, term, count(pnum) as countClass FROM class \
		WHERE term IN (select term FROM mark) \
		GROUP BY cnum, term, pnum \
		HAVING count(pnum)>=2 \
	) \
	GROUP BY pnum, term \
	HAVING count(pnum)>=2 \
) \
AND pnum IN ( \
	SELECT pnum FROM ( \
		SELECT pnum, cnum, term, count(pnum) FROM class \
		WHERE term NOT IN (select term FROM mark) \
		GROUP BY cnum, term, pnum \
		HAVING count(pnum)>=2 \
	) \
	GROUP BY pnum, term \ 
	HAVING count(pnum)>=2 \
)

