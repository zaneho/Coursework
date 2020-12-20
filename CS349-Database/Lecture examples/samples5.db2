echo you must copy the database first (use "sampleDB.sql")
connect to cs348
update command options using c off

echo Insertion:
insert into author						\
       values (4, 'Niwinski, Damian',				\
          'http://zls.mimuw.edu.pl/~niwinski' )

insert into author (						\
       select max(aid)+1, 'Snodgrass, Richard T.',		\
              'http://www.cs.arizona.edu/people/rts'		\
       from author						\
       )

select * from author

echo Delation:
delete from publication						\
       where pubid not in (					\
             select pubid					\
             from article					\
       ) and pubid not in (					\
             select crossref					\
             from article					\
       )

select * from publication

echo Update:
update author							\
set    url = 'http://brics.dk/~david'				\
where  aid in (							\
         select aid						\
         from author						\
         where name like 'Toman%'				\
       )

select * from author

echo View Update 1:
create view autpub as (						\
   select name,title						\
   from   author, wrote, publication				\
   where  aid=author						\
   and    pubid=publication )

select * from autpub

insert into autpub values ('foo','bar')

echo View Update 2:
create view jlpauthor as (					\
  select *  							\
  from   author							\
  where  aid in (						\
     select author						\
     from wrote, article, journal				\
     where publication=article.pubid				\
       and crossref=journal.pubid				\
  ) ) with check option

select * from jlpauthor

insert into jlpauthor values (1,'foo','bar')

insert into jlpauthor values (4,'baz', null)

select * from jlpauthor

drop view autpub
drop view jlpauthor
rollback
update command options using c on
