connect to cs348

select aid,name 				\
from david.author

select distinct name 				\
from david.author

select pubid,volume,no         			\
from david.journal				\
where year = 1998

select name, title				\
from david.author,david.publication,david.wrote	\
where aid=author and pubid=publication		\

select distinct name				\
from david.author				\
where not exists (				\
   select *					\
   from david.book, david.wrote			\
   where aid=author				\
     and pubid=publication)

(select pubid from david.book) 			\
union						\
(select pubid from david.journal)

(select pubid from david.publication)		\
except						\
(select pubid from david.article)

