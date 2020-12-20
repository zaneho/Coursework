connect to cs348
set schema david

select title					\
from publication, book				\
where publication.pubid=book.pubid		\
  and title like 'Logic%'			\
  and year between 1980 and 2000

select title					\
from publication				\
where pubid in (				\
   select pubid from article			\
)

select *                                     	\
from wrote					\
where publication not in (			\
   ( select pubid from book )			\
   union					\
   ( select pubid from journal )		\
)

select *  					\
from wrote					\
where publication not in (			\
      select pubid from book			\
) and publication not in (			\
      select pubid from journal			\
)

select pubid					\
from article					\
where endpage-startpage>=all (			\
    select endpage-startpage			\
    from   article				\
)

select *					\
from wrote r					\
where exists (					\
      select *					\
      from wrote s				\
      where r.publication=s.publication		\
        and r.author<>s.author			\
)

select *					\
from wrote r					\
where not exists (				\
      select *					\
      from wrote s				\
      where r.publication=s.publication		\
        and r.author<>s.author			\
)

select *					\
from wrote r					\
where publication in (				\
      select publication			\
      from wrote s				\
      where r.author<>s.author			\
)

select a1.name, a2.name				\
from author a1, author a2			\
where not exists (				\
   select * 					\
   from   publication p, wrote w1		\
   where  p.pubid=w1.publication		\
     and  a1.aid=w1.author			\
     and  a2.aid not in (			\
             select author			\
             from   wrote			\
             where  publication=p.pubid		\
               and  author<>a1.aid		\
     )						\
)

select aid, name     				\
from   author					\
where  url IS NULL
