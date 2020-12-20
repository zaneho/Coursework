connect to cs348
set schema david

( select pubid from book ) 			\
union						\
( select pubid from journal )

( select pubid from publication )		\
except						\
( select pubid from article )

select r1.publication				\
from wrote r1, wrote r2				\
where r1.publication=r2.publication		\
  and r1.author<>r2.author

( select author 				\
  from wrote, book 				\
  where publication=pubid )			\
union all					\
( select author 				\
  from wrote, article				\
  where publication=pubid )

create view bookorjournal as			\
  ( (select pubid from book)			\
    union					\
    (select pubid from journal)			\
  )

select title 					\
from publication, bookorjournal			\
where publication.pubid=bookorjournal.pubid

drop view bookorjournal

select title					\
from publication,				\
     ( (select pubid from book) 		\
       union 					\
       (select pubid from journal) ) bj		\
where publication.pubid=bj.pubid

select publication, count(author) 		\
from wrote					\
group by publication

select author,sum(endpage-startpage+1) as pages	\
from wrote, article				\
where publication=pubid				\
group by author

select publication, count(author)		\
from wrote					\
group by publication				\
having count(author)=1

select name, count(aid)				\
from author, (					\
 ( select author 				\
   from wrote, book 				\
   where publication=pubid )			\
 union all					\
 ( select author 				\
   from wrote, article 				\
   where publication=pubid ) ) ba		\
where aid=author				\
group by name,aid

