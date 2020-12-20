connect to cs348  
set schema david 

select *					\
from author

select title					\
from publication, book				\
where publication.pubid=book.pubid

select distinct r1.publication			\
from wrote r1, wrote r2				\
where r1.publication=r2.publication		\
  and r1.author<>r2.author

select pubid, endpage-startpage+1        	\
from article

select pubid as id, 				\
       endpage-startpage+1 as numberofpages	\
from article

select * from journal where year>=1997

select * from article 				\
where endpage-startpage>20

select distinct r1.publication			\
from wrote r1, wrote r2				\
where r1.publication=r2.publication		\
  and not r1.author=r2.author

