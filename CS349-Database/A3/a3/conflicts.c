static char sqla_program_id[292] = 
{
 172,0,65,69,65,85,65,73,90,66,103,69,77,74,76,106,48,49,49,49,
 49,32,50,32,32,32,32,32,32,32,32,32,8,0,90,52,72,79,32,32,
 32,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,8,0,67,79,78,70,76,73,67,84,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0
};

#include "sqladef.h"

static struct sqla_runtime_info sqla_rtinfo = 
{{'S','Q','L','A','R','T','I','N'}, sizeof(wchar_t), 0, {' ',' ',' ',' '}};


static const short sqlIsLiteral   = SQL_IS_LITERAL;
static const short sqlIsInputHvar = SQL_IS_INPUT_HVAR;


#line 1 "conflicts.sqc"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include "util.h"



/*
EXEC SQL INCLUDE SQLCA;
*/

/* SQL Communication Area - SQLCA - structures and constants */
#include "sqlca.h"
struct sqlca sqlca;


#line 7 "conflicts.sqc"
 


/*
EXEC SQL BEGIN DECLARE SECTION;
*/

#line 9 "conflicts.sqc"

   char db[6] = "cs348";
   char  SIN[20];

   char cnum[5],room[7],term[3];
   sqlint32 section, p1;
   char c2[5],r2[7],t2[3];
   sqlint32 s2, p2;
   char day[10],time[5];

   sqlint32 countE=0;

/*
EXEC SQL END DECLARE SECTION;
*/

#line 20 "conflicts.sqc"


int main(int argc, char *argv[]) {
   if (argc<2) {
      printf("Usage: conflicts <pattern>\n");
      exit(1);
   };

int count=0;

   
/*
EXEC SQL WHENEVER SQLERROR  GO TO error;
*/

#line 30 "conflicts.sqc"


   
/*
EXEC SQL CONNECT TO :db;
*/

{
#line 32 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 32 "conflicts.sqc"
  sqlaaloc(2,1,1,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 32 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 6;
#line 32 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)db;
#line 32 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 32 "conflicts.sqc"
      sqlasetdata(2,0,1,sql_setdlist,0L,0L);
    }
#line 32 "conflicts.sqc"
  sqlacall((unsigned short)29,4,2,0,0L);
#line 32 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 32 "conflicts.sqc"
  sqlastop(0L);
}

#line 32 "conflicts.sqc"


   strncpy(SIN,argv[1],20);

   
/*
EXEC SQL DECLARE conflicts CURSOR FOR 
SELECT * FROM (
SELECT DISTINCT c1.day, c1.time FROM
(SELECT q2.cnum, q2.term, q2.section, s.day, s.time, s.room FROM schedule as s, 
(SELECT q1.cnum, q1.term, q1.section FROM 
((SELECT cnum, term, section from ENROLLMENT WHERE SNUM = :SIN) 
UNION 
(SELECT cnum, term, section from CLASS WHERE PNUM =:SIN)) as q1 
WHERE NOT EXISTS 
(SELECT m.cnum, m.term, m.section FROM MARK as m 
WHERE q1.cnum=m.cnum AND q1.term=m.term AND q1.section=m.section)) as q2 
WHERE q2.cnum=s.cnum AND q2.section=s.section AND q2.term=s.term) as c1, 
(SELECT q2.cnum, q2.term, q2.section, s.day, s.time, s.room FROM schedule as s, 
(SELECT q1.cnum, q1.term, q1.section FROM 
((SELECT cnum, term, section from ENROLLMENT WHERE SNUM = :SIN) 
UNION 
(SELECT cnum, term, section from CLASS WHERE PNUM =:SIN)) as q1 
WHERE NOT EXISTS 
(SELECT m.cnum, m.term, m.section FROM MARK as m 
WHERE q1.cnum=m.cnum AND q1.term=m.term AND q1.section=m.section)) as q2 
WHERE q2.cnum=s.cnum AND q2.section=s.section AND q2.term=s.term) as c2 
WHERE c1.day=c2.day AND c1.time=c2.time AND c1.term=c2.term AND (c1.cnum<>c2.cnum OR c1.section<>c2.section))
ORDER BY 
	CASE day 
		WHEN 'MONDAY' THEN 1 
		WHEN 'TUESDAY' THEN 2 
		WHEN 'WEDNESDAY' THEN 3 
		WHEN 'THURSDAY' THEN 4 
		WHEN 'FRIDAY' THEN 5 
		WHEN 'SATURDAY' THEN 6 
		WHEN 'SUNDAY' THEN 7 
	END, time;
*/

#line 67 "conflicts.sqc"



   
/*
EXEC SQL OPEN conflicts;
*/

{
#line 70 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 70 "conflicts.sqc"
  sqlaaloc(2,4,2,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 70 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 70 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 70 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 70 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 20;
#line 70 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)SIN;
#line 70 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 70 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 20;
#line 70 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)SIN;
#line 70 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 70 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 20;
#line 70 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)SIN;
#line 70 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 70 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 70 "conflicts.sqc"
  sqlacall((unsigned short)26,1,2,0,0L);
#line 70 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 70 "conflicts.sqc"
  sqlastop(0L);
}

#line 70 "conflicts.sqc"

   
/*
EXEC SQL WHENEVER NOT FOUND GO TO end;
*/

#line 71 "conflicts.sqc"


   for (;;) {
     
/*
EXEC SQL FETCH conflicts INTO :day,:time;
*/

{
#line 74 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 74 "conflicts.sqc"
  sqlaaloc(3,2,3,0L);
    {
      struct sqla_setdata_list sql_setdlist[2];
#line 74 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 10;
#line 74 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)day;
#line 74 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 74 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 5;
#line 74 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)time;
#line 74 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 74 "conflicts.sqc"
      sqlasetdata(3,0,2,sql_setdlist,0L,0L);
    }
#line 74 "conflicts.sqc"
  sqlacall((unsigned short)25,1,0,3,0L);
#line 74 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 74 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 74 "conflicts.sqc"
  sqlastop(0L);
}

#line 74 "conflicts.sqc"


count++;
	   
/*
EXEC SQL DECLARE getConflicts CURSOR FOR 
(SELECT q2.cnum,q2.term, q2.section, s.day, s.time, s.room, q2.priority FROM schedule as s, 
(SELECT q1.cnum, q1.term, q1.section, q1.priority FROM 
((SELECT cnum, term, section, 0 as priority from ENROLLMENT WHERE SNUM = :SIN) 
UNION 
(SELECT cnum, term, section, 1 as priority from CLASS WHERE PNUM =:SIN)) as q1 
WHERE NOT EXISTS 
(SELECT m.cnum, m.term, m.section FROM MARK as m 
WHERE q1.cnum=m.cnum AND q1.term=m.term AND q1.section=m.section)) as q2 
WHERE q2.cnum=s.cnum AND q2.section=s.section AND q2.term=s.term 
AND day= :day AND time= :time);
*/

#line 87 "conflicts.sqc"


		
/*
EXEC SQL OPEN getConflicts;
*/

{
#line 89 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 89 "conflicts.sqc"
  sqlaaloc(2,4,4,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 89 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 89 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 89 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 89 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 20;
#line 89 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)SIN;
#line 89 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 89 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 10;
#line 89 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)day;
#line 89 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 89 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 5;
#line 89 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)time;
#line 89 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 89 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 89 "conflicts.sqc"
  sqlacall((unsigned short)26,2,2,0,0L);
#line 89 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 89 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 89 "conflicts.sqc"
  sqlastop(0L);
}

#line 89 "conflicts.sqc"

		
/*
EXEC SQL FETCH getConflicts INTO :cnum,:term,:section,:day,:time,:room,:p1;
*/

{
#line 90 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 90 "conflicts.sqc"
  sqlaaloc(3,7,5,0L);
    {
      struct sqla_setdata_list sql_setdlist[7];
#line 90 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 90 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)cnum;
#line 90 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 90 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 90 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)term;
#line 90 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 90 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 90 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&section;
#line 90 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 90 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 10;
#line 90 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)day;
#line 90 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 90 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 5;
#line 90 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)time;
#line 90 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 90 "conflicts.sqc"
      sql_setdlist[5].sqltype = 460; sql_setdlist[5].sqllen = 7;
#line 90 "conflicts.sqc"
      sql_setdlist[5].sqldata = (void*)room;
#line 90 "conflicts.sqc"
      sql_setdlist[5].sqlind = 0L;
#line 90 "conflicts.sqc"
      sql_setdlist[6].sqltype = 496; sql_setdlist[6].sqllen = 4;
#line 90 "conflicts.sqc"
      sql_setdlist[6].sqldata = (void*)&p1;
#line 90 "conflicts.sqc"
      sql_setdlist[6].sqlind = 0L;
#line 90 "conflicts.sqc"
      sqlasetdata(3,0,7,sql_setdlist,0L,0L);
    }
#line 90 "conflicts.sqc"
  sqlacall((unsigned short)25,2,0,3,0L);
#line 90 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 90 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 90 "conflicts.sqc"
  sqlastop(0L);
}

#line 90 "conflicts.sqc"

		
/*
EXEC SQL FETCH getConflicts INTO :c2,:t2,:s2,:day,:time,:r2,:p2;
*/

{
#line 91 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 91 "conflicts.sqc"
  sqlaaloc(3,7,6,0L);
    {
      struct sqla_setdata_list sql_setdlist[7];
#line 91 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 91 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)c2;
#line 91 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 91 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 91 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)t2;
#line 91 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 91 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 91 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&s2;
#line 91 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 91 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 10;
#line 91 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)day;
#line 91 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 91 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 5;
#line 91 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)time;
#line 91 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 91 "conflicts.sqc"
      sql_setdlist[5].sqltype = 460; sql_setdlist[5].sqllen = 7;
#line 91 "conflicts.sqc"
      sql_setdlist[5].sqldata = (void*)r2;
#line 91 "conflicts.sqc"
      sql_setdlist[5].sqlind = 0L;
#line 91 "conflicts.sqc"
      sql_setdlist[6].sqltype = 496; sql_setdlist[6].sqllen = 4;
#line 91 "conflicts.sqc"
      sql_setdlist[6].sqldata = (void*)&p2;
#line 91 "conflicts.sqc"
      sql_setdlist[6].sqlind = 0L;
#line 91 "conflicts.sqc"
      sqlasetdata(3,0,7,sql_setdlist,0L,0L);
    }
#line 91 "conflicts.sqc"
  sqlacall((unsigned short)25,2,0,3,0L);
#line 91 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 91 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 91 "conflicts.sqc"
  sqlastop(0L);
}

#line 91 "conflicts.sqc"

		
/*
EXEC SQL CLOSE getConflicts;
*/

{
#line 92 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 92 "conflicts.sqc"
  sqlacall((unsigned short)20,2,0,0,0L);
#line 92 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 92 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 92 "conflicts.sqc"
  sqlastop(0L);
}

#line 92 "conflicts.sqc"


printf("%s %s: %s(%i) %s -- %s(%i) %s -- ",day,time,cnum,section,room,c2,s2,r2);
//1. teach VS enroll
if(p1 != p2){
	//delete c2
	if(p1>p2){
		printf("%s (%i) deleted",c2,s2);
			if(p2==0){//enroll
				
/*
EXEC SQL SELECT count(*) INTO :countE FROM enrollment
				WHERE snum=:SIN AND cnum=:c2 
				AND term=:t2 AND section=:s2;
*/

{
#line 103 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 103 "conflicts.sqc"
  sqlaaloc(2,4,7,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 103 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 103 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 103 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 103 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 5;
#line 103 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)c2;
#line 103 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 103 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 103 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)t2;
#line 103 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 103 "conflicts.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 103 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)&s2;
#line 103 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 103 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 103 "conflicts.sqc"
  sqlaaloc(3,1,8,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 103 "conflicts.sqc"
      sql_setdlist[0].sqltype = 496; sql_setdlist[0].sqllen = 4;
#line 103 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)&countE;
#line 103 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 103 "conflicts.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 103 "conflicts.sqc"
  sqlacall((unsigned short)24,3,2,3,0L);
#line 103 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 103 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 103 "conflicts.sqc"
  sqlastop(0L);
}

#line 103 "conflicts.sqc"


				if(countE>0){
					
/*
EXEC SQL DELETE FROM enrollment
					WHERE snum=:SIN AND cnum=:c2 AND term=:t2 AND section=:s2;
*/

{
#line 107 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 107 "conflicts.sqc"
  sqlaaloc(2,4,9,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 107 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 107 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 107 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 107 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 5;
#line 107 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)c2;
#line 107 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 107 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 107 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)t2;
#line 107 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 107 "conflicts.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 107 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)&s2;
#line 107 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 107 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 107 "conflicts.sqc"
  sqlacall((unsigned short)24,4,2,0,0L);
#line 107 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 107 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 107 "conflicts.sqc"
  sqlastop(0L);
}

#line 107 "conflicts.sqc"

				}

			}else{//teach
				
/*
EXEC SQL SELECT count(*) INTO :countE FROM schedule
				WHERE cnum=:c2 AND term=:t2 AND section=:s2 
				AND day=:day AND time=:time;
*/

{
#line 113 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 113 "conflicts.sqc"
  sqlaaloc(2,5,10,0L);
    {
      struct sqla_setdata_list sql_setdlist[5];
#line 113 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 113 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)c2;
#line 113 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 113 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 113 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)t2;
#line 113 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 113 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 113 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&s2;
#line 113 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 113 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 10;
#line 113 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)day;
#line 113 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 113 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 5;
#line 113 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)time;
#line 113 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 113 "conflicts.sqc"
      sqlasetdata(2,0,5,sql_setdlist,0L,0L);
    }
#line 113 "conflicts.sqc"
  sqlaaloc(3,1,11,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 113 "conflicts.sqc"
      sql_setdlist[0].sqltype = 496; sql_setdlist[0].sqllen = 4;
#line 113 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)&countE;
#line 113 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 113 "conflicts.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 113 "conflicts.sqc"
  sqlacall((unsigned short)24,5,2,3,0L);
#line 113 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 113 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 113 "conflicts.sqc"
  sqlastop(0L);
}

#line 113 "conflicts.sqc"


				if(countE>0){
					
/*
EXEC SQL DELETE FROM schedule
					WHERE cnum=:c2 AND term=:t2 AND section=:s2 
					AND day=:day AND time=:time;
*/

{
#line 118 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 118 "conflicts.sqc"
  sqlaaloc(2,5,12,0L);
    {
      struct sqla_setdata_list sql_setdlist[5];
#line 118 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 118 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)c2;
#line 118 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 118 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 118 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)t2;
#line 118 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 118 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 118 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&s2;
#line 118 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 118 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 10;
#line 118 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)day;
#line 118 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 118 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 5;
#line 118 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)time;
#line 118 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 118 "conflicts.sqc"
      sqlasetdata(2,0,5,sql_setdlist,0L,0L);
    }
#line 118 "conflicts.sqc"
  sqlacall((unsigned short)24,6,2,0,0L);
#line 118 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 118 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 118 "conflicts.sqc"
  sqlastop(0L);
}

#line 118 "conflicts.sqc"

				}
			}
	//delete cnum
	}else{
		printf("%s (%i) deleted",cnum,section);
			if(p1==0){//enroll
				
/*
EXEC SQL SELECT count(*) INTO :countE FROM enrollment
				WHERE snum=:SIN AND cnum=:cnum AND term=:term AND section=:section;
*/

{
#line 126 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 126 "conflicts.sqc"
  sqlaaloc(2,4,13,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 126 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 126 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 126 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 126 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 5;
#line 126 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)cnum;
#line 126 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 126 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 126 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)term;
#line 126 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 126 "conflicts.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 126 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)&section;
#line 126 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 126 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 126 "conflicts.sqc"
  sqlaaloc(3,1,14,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 126 "conflicts.sqc"
      sql_setdlist[0].sqltype = 496; sql_setdlist[0].sqllen = 4;
#line 126 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)&countE;
#line 126 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 126 "conflicts.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 126 "conflicts.sqc"
  sqlacall((unsigned short)24,7,2,3,0L);
#line 126 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 126 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 126 "conflicts.sqc"
  sqlastop(0L);
}

#line 126 "conflicts.sqc"


				if(countE>0){
					
/*
EXEC SQL DELETE FROM enrollment
					WHERE snum=:SIN AND cnum=:cnum AND term=:term AND section=:section;
*/

{
#line 130 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 130 "conflicts.sqc"
  sqlaaloc(2,4,15,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 130 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 130 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 130 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 130 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 5;
#line 130 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)cnum;
#line 130 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 130 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 130 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)term;
#line 130 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 130 "conflicts.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 130 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)&section;
#line 130 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 130 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 130 "conflicts.sqc"
  sqlacall((unsigned short)24,8,2,0,0L);
#line 130 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 130 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 130 "conflicts.sqc"
  sqlastop(0L);
}

#line 130 "conflicts.sqc"

				}			
			}else{//teach
				
/*
EXEC SQL SELECT count(*) INTO :countE FROM schedule
				WHERE cnum=:cnum AND term=:term AND section=:section
				AND day=:day AND time=:time;
*/

{
#line 135 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 135 "conflicts.sqc"
  sqlaaloc(2,5,16,0L);
    {
      struct sqla_setdata_list sql_setdlist[5];
#line 135 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 135 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)cnum;
#line 135 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 135 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 135 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)term;
#line 135 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 135 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 135 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&section;
#line 135 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 135 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 10;
#line 135 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)day;
#line 135 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 135 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 5;
#line 135 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)time;
#line 135 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 135 "conflicts.sqc"
      sqlasetdata(2,0,5,sql_setdlist,0L,0L);
    }
#line 135 "conflicts.sqc"
  sqlaaloc(3,1,17,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 135 "conflicts.sqc"
      sql_setdlist[0].sqltype = 496; sql_setdlist[0].sqllen = 4;
#line 135 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)&countE;
#line 135 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 135 "conflicts.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 135 "conflicts.sqc"
  sqlacall((unsigned short)24,9,2,3,0L);
#line 135 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 135 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 135 "conflicts.sqc"
  sqlastop(0L);
}

#line 135 "conflicts.sqc"


				if(countE>0){
					
/*
EXEC SQL DELETE FROM schedule
					WHERE cnum=:cnum AND term=:term AND section=:section
					AND time=:time AND day=:day;
*/

{
#line 140 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 140 "conflicts.sqc"
  sqlaaloc(2,5,18,0L);
    {
      struct sqla_setdata_list sql_setdlist[5];
#line 140 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 140 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)cnum;
#line 140 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 140 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 140 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)term;
#line 140 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 140 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 140 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&section;
#line 140 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 140 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 5;
#line 140 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)time;
#line 140 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 140 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 10;
#line 140 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)day;
#line 140 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 140 "conflicts.sqc"
      sqlasetdata(2,0,5,sql_setdlist,0L,0L);
    }
#line 140 "conflicts.sqc"
  sqlacall((unsigned short)24,10,2,0,0L);
#line 140 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 140 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 140 "conflicts.sqc"
  sqlastop(0L);
}

#line 140 "conflicts.sqc"

				}			
			}
	}
}

	//2. same department, lower level class precedence
else if(strcmp(cnum,c2)!=0 && cnum[0]==c2[0] && cnum[1]==c2[1]){

	int cnumi = atoi(&cnum[2]);
	int c2i = atoi(&c2[2]);

	if(cnumi < c2i){
		//delete c2i, c2i higher level course
		printf("%s (%i) deleted",c2,s2);
			if(p2==0){//enroll
				
/*
EXEC SQL SELECT count(*) INTO :countE FROM enrollment
				WHERE snum=:SIN AND cnum=:c2 
				AND term=:t2 AND section=:s2;
*/

{
#line 158 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 158 "conflicts.sqc"
  sqlaaloc(2,4,19,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 158 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 158 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 158 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 158 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 5;
#line 158 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)c2;
#line 158 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 158 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 158 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)t2;
#line 158 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 158 "conflicts.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 158 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)&s2;
#line 158 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 158 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 158 "conflicts.sqc"
  sqlaaloc(3,1,20,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 158 "conflicts.sqc"
      sql_setdlist[0].sqltype = 496; sql_setdlist[0].sqllen = 4;
#line 158 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)&countE;
#line 158 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 158 "conflicts.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 158 "conflicts.sqc"
  sqlacall((unsigned short)24,11,2,3,0L);
#line 158 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 158 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 158 "conflicts.sqc"
  sqlastop(0L);
}

#line 158 "conflicts.sqc"


				if(countE>0){
					
/*
EXEC SQL DELETE FROM enrollment
					WHERE snum=:SIN AND cnum=:c2 AND term=:t2 AND section=:s2;
*/

{
#line 162 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 162 "conflicts.sqc"
  sqlaaloc(2,4,21,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 162 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 162 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 162 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 162 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 5;
#line 162 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)c2;
#line 162 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 162 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 162 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)t2;
#line 162 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 162 "conflicts.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 162 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)&s2;
#line 162 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 162 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 162 "conflicts.sqc"
  sqlacall((unsigned short)24,12,2,0,0L);
#line 162 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 162 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 162 "conflicts.sqc"
  sqlastop(0L);
}

#line 162 "conflicts.sqc"

				}
			}else{//teach			
				
/*
EXEC SQL SELECT count(*) INTO :countE FROM schedule
				WHERE cnum=:c2 AND term=:t2 AND section=:s2 
				AND day=:day AND time=:time;
*/

{
#line 167 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 167 "conflicts.sqc"
  sqlaaloc(2,5,22,0L);
    {
      struct sqla_setdata_list sql_setdlist[5];
#line 167 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 167 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)c2;
#line 167 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 167 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 167 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)t2;
#line 167 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 167 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 167 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&s2;
#line 167 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 167 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 10;
#line 167 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)day;
#line 167 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 167 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 5;
#line 167 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)time;
#line 167 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 167 "conflicts.sqc"
      sqlasetdata(2,0,5,sql_setdlist,0L,0L);
    }
#line 167 "conflicts.sqc"
  sqlaaloc(3,1,23,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 167 "conflicts.sqc"
      sql_setdlist[0].sqltype = 496; sql_setdlist[0].sqllen = 4;
#line 167 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)&countE;
#line 167 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 167 "conflicts.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 167 "conflicts.sqc"
  sqlacall((unsigned short)24,13,2,3,0L);
#line 167 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 167 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 167 "conflicts.sqc"
  sqlastop(0L);
}

#line 167 "conflicts.sqc"


				if(countE>0){
					
/*
EXEC SQL DELETE FROM schedule
					WHERE cnum=:c2 AND term=:t2 AND section=:s2 
					AND day=:day AND time=:time;
*/

{
#line 172 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 172 "conflicts.sqc"
  sqlaaloc(2,5,24,0L);
    {
      struct sqla_setdata_list sql_setdlist[5];
#line 172 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 172 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)c2;
#line 172 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 172 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 172 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)t2;
#line 172 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 172 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 172 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&s2;
#line 172 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 172 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 10;
#line 172 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)day;
#line 172 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 172 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 5;
#line 172 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)time;
#line 172 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 172 "conflicts.sqc"
      sqlasetdata(2,0,5,sql_setdlist,0L,0L);
    }
#line 172 "conflicts.sqc"
  sqlacall((unsigned short)24,14,2,0,0L);
#line 172 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 172 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 172 "conflicts.sqc"
  sqlastop(0L);
}

#line 172 "conflicts.sqc"

				}
			}
	}else{
	//delete c1, c1 is higher level course
		printf("%s (%i) deleted",cnum,section);
			if(p1==0){//enroll
				
/*
EXEC SQL SELECT count(*) INTO :countE FROM enrollment
				WHERE snum=:SIN AND cnum=:cnum AND term=:term AND section=:section;
*/

{
#line 180 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 180 "conflicts.sqc"
  sqlaaloc(2,4,25,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 180 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 180 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 180 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 180 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 5;
#line 180 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)cnum;
#line 180 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 180 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 180 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)term;
#line 180 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 180 "conflicts.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 180 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)&section;
#line 180 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 180 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 180 "conflicts.sqc"
  sqlaaloc(3,1,26,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 180 "conflicts.sqc"
      sql_setdlist[0].sqltype = 496; sql_setdlist[0].sqllen = 4;
#line 180 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)&countE;
#line 180 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 180 "conflicts.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 180 "conflicts.sqc"
  sqlacall((unsigned short)24,15,2,3,0L);
#line 180 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 180 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 180 "conflicts.sqc"
  sqlastop(0L);
}

#line 180 "conflicts.sqc"


				if(countE>0){
					
/*
EXEC SQL DELETE FROM enrollment
					WHERE snum=:SIN AND cnum=:cnum AND term=:term AND section=:section;
*/

{
#line 184 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 184 "conflicts.sqc"
  sqlaaloc(2,4,27,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 184 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 184 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 184 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 184 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 5;
#line 184 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)cnum;
#line 184 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 184 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 184 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)term;
#line 184 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 184 "conflicts.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 184 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)&section;
#line 184 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 184 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 184 "conflicts.sqc"
  sqlacall((unsigned short)24,16,2,0,0L);
#line 184 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 184 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 184 "conflicts.sqc"
  sqlastop(0L);
}

#line 184 "conflicts.sqc"

				}
			}else{//teach
				
/*
EXEC SQL SELECT count(*) INTO :countE FROM schedule
				WHERE cnum=:cnum AND term=:term AND section=:section
				AND day=:day AND time=:time;
*/

{
#line 189 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 189 "conflicts.sqc"
  sqlaaloc(2,5,28,0L);
    {
      struct sqla_setdata_list sql_setdlist[5];
#line 189 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 189 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)cnum;
#line 189 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 189 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 189 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)term;
#line 189 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 189 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 189 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&section;
#line 189 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 189 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 10;
#line 189 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)day;
#line 189 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 189 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 5;
#line 189 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)time;
#line 189 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 189 "conflicts.sqc"
      sqlasetdata(2,0,5,sql_setdlist,0L,0L);
    }
#line 189 "conflicts.sqc"
  sqlaaloc(3,1,29,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 189 "conflicts.sqc"
      sql_setdlist[0].sqltype = 496; sql_setdlist[0].sqllen = 4;
#line 189 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)&countE;
#line 189 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 189 "conflicts.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 189 "conflicts.sqc"
  sqlacall((unsigned short)24,17,2,3,0L);
#line 189 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 189 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 189 "conflicts.sqc"
  sqlastop(0L);
}

#line 189 "conflicts.sqc"


				if(countE>0){
					
/*
EXEC SQL DELETE FROM schedule
					WHERE cnum=:cnum AND term=:term AND section=:section
					AND time=:time AND day=:day;
*/

{
#line 194 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 194 "conflicts.sqc"
  sqlaaloc(2,5,30,0L);
    {
      struct sqla_setdata_list sql_setdlist[5];
#line 194 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 194 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)cnum;
#line 194 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 194 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 194 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)term;
#line 194 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 194 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 194 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&section;
#line 194 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 194 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 5;
#line 194 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)time;
#line 194 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 194 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 10;
#line 194 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)day;
#line 194 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 194 "conflicts.sqc"
      sqlasetdata(2,0,5,sql_setdlist,0L,0L);
    }
#line 194 "conflicts.sqc"
  sqlacall((unsigned short)24,18,2,0,0L);
#line 194 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 194 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 194 "conflicts.sqc"
  sqlastop(0L);
}

#line 194 "conflicts.sqc"

				}
			}
	}
}

else if(strcmp(cnum,c2)==0){
//3. same class, lower section preferred
	if(section<s2){
	//section is lower, delete s2
		printf("%s (%i) deleted",c2,s2);

			if(p2==0){//enroll
				
/*
EXEC SQL SELECT count(*) INTO :countE FROM enrollment
				WHERE snum=:SIN AND cnum=:c2 AND term=:t2 AND section=:s2;
*/

{
#line 208 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 208 "conflicts.sqc"
  sqlaaloc(2,4,31,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 208 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 208 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 208 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 208 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 5;
#line 208 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)c2;
#line 208 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 208 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 208 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)t2;
#line 208 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 208 "conflicts.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 208 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)&s2;
#line 208 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 208 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 208 "conflicts.sqc"
  sqlaaloc(3,1,32,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 208 "conflicts.sqc"
      sql_setdlist[0].sqltype = 496; sql_setdlist[0].sqllen = 4;
#line 208 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)&countE;
#line 208 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 208 "conflicts.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 208 "conflicts.sqc"
  sqlacall((unsigned short)24,19,2,3,0L);
#line 208 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 208 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 208 "conflicts.sqc"
  sqlastop(0L);
}

#line 208 "conflicts.sqc"


				if(countE>0){
					
/*
EXEC SQL DELETE FROM enrollment
					WHERE snum=:SIN AND cnum=:c2 AND term=:t2 AND section=:s2;
*/

{
#line 212 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 212 "conflicts.sqc"
  sqlaaloc(2,4,33,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 212 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 212 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 212 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 212 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 5;
#line 212 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)c2;
#line 212 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 212 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 212 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)t2;
#line 212 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 212 "conflicts.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 212 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)&s2;
#line 212 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 212 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 212 "conflicts.sqc"
  sqlacall((unsigned short)24,20,2,0,0L);
#line 212 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 212 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 212 "conflicts.sqc"
  sqlastop(0L);
}

#line 212 "conflicts.sqc"

				}
			}else{//teach
				
/*
EXEC SQL SELECT count(*) INTO :countE FROM schedule
				WHERE cnum=:c2 AND term=:t2 AND section=:s2 
				AND day=:day AND time=:time;
*/

{
#line 217 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 217 "conflicts.sqc"
  sqlaaloc(2,5,34,0L);
    {
      struct sqla_setdata_list sql_setdlist[5];
#line 217 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 217 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)c2;
#line 217 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 217 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 217 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)t2;
#line 217 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 217 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 217 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&s2;
#line 217 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 217 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 10;
#line 217 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)day;
#line 217 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 217 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 5;
#line 217 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)time;
#line 217 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 217 "conflicts.sqc"
      sqlasetdata(2,0,5,sql_setdlist,0L,0L);
    }
#line 217 "conflicts.sqc"
  sqlaaloc(3,1,35,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 217 "conflicts.sqc"
      sql_setdlist[0].sqltype = 496; sql_setdlist[0].sqllen = 4;
#line 217 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)&countE;
#line 217 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 217 "conflicts.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 217 "conflicts.sqc"
  sqlacall((unsigned short)24,21,2,3,0L);
#line 217 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 217 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 217 "conflicts.sqc"
  sqlastop(0L);
}

#line 217 "conflicts.sqc"


				if(countE>0){
					
/*
EXEC SQL DELETE FROM schedule
					WHERE cnum=:c2 AND term=:t2 AND section=:s2 
					AND day=:day AND time=:time;
*/

{
#line 222 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 222 "conflicts.sqc"
  sqlaaloc(2,5,36,0L);
    {
      struct sqla_setdata_list sql_setdlist[5];
#line 222 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 222 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)c2;
#line 222 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 222 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 222 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)t2;
#line 222 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 222 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 222 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&s2;
#line 222 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 222 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 10;
#line 222 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)day;
#line 222 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 222 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 5;
#line 222 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)time;
#line 222 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 222 "conflicts.sqc"
      sqlasetdata(2,0,5,sql_setdlist,0L,0L);
    }
#line 222 "conflicts.sqc"
  sqlacall((unsigned short)24,22,2,0,0L);
#line 222 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 222 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 222 "conflicts.sqc"
  sqlastop(0L);
}

#line 222 "conflicts.sqc"

				}
			}

	}else {
	//s2 is lower, delete section
		printf("%s (%i) deleted",cnum,section);
			if(p1==0){//enroll
				
/*
EXEC SQL SELECT count(*) INTO :countE FROM enrollment
				WHERE snum=:SIN AND cnum=:cnum AND term=:term AND section=:section;
*/

{
#line 231 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 231 "conflicts.sqc"
  sqlaaloc(2,4,37,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 231 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 231 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 231 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 231 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 5;
#line 231 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)cnum;
#line 231 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 231 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 231 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)term;
#line 231 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 231 "conflicts.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 231 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)&section;
#line 231 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 231 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 231 "conflicts.sqc"
  sqlaaloc(3,1,38,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 231 "conflicts.sqc"
      sql_setdlist[0].sqltype = 496; sql_setdlist[0].sqllen = 4;
#line 231 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)&countE;
#line 231 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 231 "conflicts.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 231 "conflicts.sqc"
  sqlacall((unsigned short)24,23,2,3,0L);
#line 231 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 231 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 231 "conflicts.sqc"
  sqlastop(0L);
}

#line 231 "conflicts.sqc"


				if(countE>0){
					
/*
EXEC SQL DELETE FROM enrollment
					WHERE snum=:SIN AND cnum=:cnum AND term=:term AND section=:section;
*/

{
#line 235 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 235 "conflicts.sqc"
  sqlaaloc(2,4,39,0L);
    {
      struct sqla_setdata_list sql_setdlist[4];
#line 235 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 235 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 235 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 235 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 5;
#line 235 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)cnum;
#line 235 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 235 "conflicts.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 235 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)term;
#line 235 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 235 "conflicts.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 235 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)&section;
#line 235 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 235 "conflicts.sqc"
      sqlasetdata(2,0,4,sql_setdlist,0L,0L);
    }
#line 235 "conflicts.sqc"
  sqlacall((unsigned short)24,24,2,0,0L);
#line 235 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 235 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 235 "conflicts.sqc"
  sqlastop(0L);
}

#line 235 "conflicts.sqc"

				}
			}else{//teach
				
/*
EXEC SQL SELECT count(*) INTO :countE FROM schedule
				WHERE cnum=:cnum AND term=:term AND section=:section
				AND day=:day AND time=:time;
*/

{
#line 240 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 240 "conflicts.sqc"
  sqlaaloc(2,5,40,0L);
    {
      struct sqla_setdata_list sql_setdlist[5];
#line 240 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 240 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)cnum;
#line 240 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 240 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 240 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)term;
#line 240 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 240 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 240 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&section;
#line 240 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 240 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 10;
#line 240 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)day;
#line 240 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 240 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 5;
#line 240 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)time;
#line 240 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 240 "conflicts.sqc"
      sqlasetdata(2,0,5,sql_setdlist,0L,0L);
    }
#line 240 "conflicts.sqc"
  sqlaaloc(3,1,41,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 240 "conflicts.sqc"
      sql_setdlist[0].sqltype = 496; sql_setdlist[0].sqllen = 4;
#line 240 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)&countE;
#line 240 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 240 "conflicts.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 240 "conflicts.sqc"
  sqlacall((unsigned short)24,25,2,3,0L);
#line 240 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 240 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 240 "conflicts.sqc"
  sqlastop(0L);
}

#line 240 "conflicts.sqc"


				if(countE>0){
					
/*
EXEC SQL DELETE FROM schedule
					WHERE cnum=:cnum AND term=:term AND section=:section
					AND time=:time AND day=:day;
*/

{
#line 245 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 245 "conflicts.sqc"
  sqlaaloc(2,5,42,0L);
    {
      struct sqla_setdata_list sql_setdlist[5];
#line 245 "conflicts.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 245 "conflicts.sqc"
      sql_setdlist[0].sqldata = (void*)cnum;
#line 245 "conflicts.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 245 "conflicts.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 3;
#line 245 "conflicts.sqc"
      sql_setdlist[1].sqldata = (void*)term;
#line 245 "conflicts.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 245 "conflicts.sqc"
      sql_setdlist[2].sqltype = 496; sql_setdlist[2].sqllen = 4;
#line 245 "conflicts.sqc"
      sql_setdlist[2].sqldata = (void*)&section;
#line 245 "conflicts.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 245 "conflicts.sqc"
      sql_setdlist[3].sqltype = 460; sql_setdlist[3].sqllen = 5;
#line 245 "conflicts.sqc"
      sql_setdlist[3].sqldata = (void*)time;
#line 245 "conflicts.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 245 "conflicts.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 10;
#line 245 "conflicts.sqc"
      sql_setdlist[4].sqldata = (void*)day;
#line 245 "conflicts.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 245 "conflicts.sqc"
      sqlasetdata(2,0,5,sql_setdlist,0L,0L);
    }
#line 245 "conflicts.sqc"
  sqlacall((unsigned short)24,26,2,0,0L);
#line 245 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 245 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 245 "conflicts.sqc"
  sqlastop(0L);
}

#line 245 "conflicts.sqc"

				}
			}
	}
}

else if(cnum[0] != c2[0]){//4. diff department
	printf("cannot be resolved");
}else if(cnum==c2 && section==s2 && room != r2){//4. diff room
	printf("cannot be resolved");
}else{
	printf("cannot be resolved");
}

countE=0;
printf("\n");

};	

end:
	if(count<=0){
		printf("Schedule conflict for (%s) does not exist.\n", SIN);
	}
   
/*
EXEC SQL CLOSE conflicts;
*/

{
#line 268 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 268 "conflicts.sqc"
  sqlacall((unsigned short)20,1,0,0,0L);
#line 268 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 268 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 268 "conflicts.sqc"
  sqlastop(0L);
}

#line 268 "conflicts.sqc"

   
/*
EXEC SQL COMMIT;
*/

{
#line 269 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 269 "conflicts.sqc"
  sqlacall((unsigned short)21,0,0,0,0L);
#line 269 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 269 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 269 "conflicts.sqc"
  sqlastop(0L);
}

#line 269 "conflicts.sqc"

   
/*
EXEC SQL CONNECT RESET;
*/

{
#line 270 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 270 "conflicts.sqc"
  sqlacall((unsigned short)29,3,0,0,0L);
#line 270 "conflicts.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 270 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 270 "conflicts.sqc"
  sqlastop(0L);
}

#line 270 "conflicts.sqc"

   exit(0);


error:
  // check_error("My error",&sqlca);
   
/*
EXEC SQL WHENEVER SQLERROR CONTINUE;
*/

#line 276 "conflicts.sqc"


   
/*
EXEC SQL ROLLBACK;
*/

{
#line 278 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 278 "conflicts.sqc"
  sqlacall((unsigned short)28,0,0,0,0L);
#line 278 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 278 "conflicts.sqc"
  sqlastop(0L);
}

#line 278 "conflicts.sqc"

   
/*
EXEC SQL CONNECT reset;
*/

{
#line 279 "conflicts.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 279 "conflicts.sqc"
  sqlacall((unsigned short)29,3,0,0,0L);
#line 279 "conflicts.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 279 "conflicts.sqc"
  sqlastop(0L);
}

#line 279 "conflicts.sqc"

   exit(1);
}

