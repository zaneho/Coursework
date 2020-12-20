SELECT distinct * FROM student WHERE snum IN ( \
	Select snum from mark where cnum= 'CS240'  \
	AND grade >= \
		(Select grade-3 from mark where cnum= 'CS240' order by grade desc limit 1))

