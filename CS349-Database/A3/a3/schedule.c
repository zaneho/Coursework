static char sqla_program_id[292] = 
{
 172,0,65,69,65,85,65,73,57,65,50,55,76,74,76,106,48,49,49,49,
 49,32,50,32,32,32,32,32,32,32,32,32,8,0,90,52,72,79,32,32,
 32,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,8,0,83,67,72,69,68,85,76,69,0,0,0,0,0,0,0,0,
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


#line 1 "schedule.sqc"
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


#line 7 "schedule.sqc"
 


/*
EXEC SQL BEGIN DECLARE SECTION;
*/

#line 9 "schedule.sqc"

   char db[6] = "cs348";
   char  SIN[20];
   char cnum[5],cname[50],term[3],day[10],room[7], time[5],name[30];
   sqlint32 section;


/*
EXEC SQL END DECLARE SECTION;
*/

#line 15 "schedule.sqc"


int main(int argc, char *argv[]) {
   if (argc<2) {
      printf("Usage: schedule <pattern>\n");
      exit(1);
   };

   
/*
EXEC SQL WHENEVER SQLERROR  GO TO error;
*/

#line 23 "schedule.sqc"


   
/*
EXEC SQL CONNECT TO :db;
*/

{
#line 25 "schedule.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 25 "schedule.sqc"
  sqlaaloc(2,1,1,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 25 "schedule.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 6;
#line 25 "schedule.sqc"
      sql_setdlist[0].sqldata = (void*)db;
#line 25 "schedule.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 25 "schedule.sqc"
      sqlasetdata(2,0,1,sql_setdlist,0L,0L);
    }
#line 25 "schedule.sqc"
  sqlacall((unsigned short)29,4,2,0,0L);
#line 25 "schedule.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 25 "schedule.sqc"
  sqlastop(0L);
}

#line 25 "schedule.sqc"


int k=1;
for(k=1;k<argc;k++){
	int i=0;

   strncpy(SIN,argv[k],20);

   
/*
EXEC SQL DECLARE schedule CURSOR FOR 

SELECT q3.cnum, q3.cname, q3.term, q3.section, s.day, s.time, s.room, q3.name 
FROM schedule as s,
	(SELECT q2.cnum, c.cname, q2.term, q2.section, q2.name FROM 
	(SELECT q1.cnum, q1.term, q1.section, q1.name FROM 
		((SELECT e.cnum, e.term, e.section, s.sname as name from ENROLLMENT e, STUDENT s WHERE e.SNUM = :SIN AND s.snum=e.snum) 
		UNION 
		(SELECT c.cnum, c.term, c.section, p.pname as name from CLASS c, PROFESSOR p WHERE c.PNUM = :SIN AND p.pnum=c.pnum)) as q1 
	WHERE NOT EXISTS 
	(SELECT m.cnum, m.term, m.section FROM MARK as m 
	WHERE q1.cnum=m.cnum AND q1.term=m.term AND q1.section=m.section)) as q2, course as c 
WHERE c.cnum=q2.cnum) as q3 
WHERE q3.cnum=s.cnum AND q3.section=s.section AND q3.term=s.term
ORDER BY 
	CASE s.day
		WHEN 'MONDAY' THEN 1
		WHEN 'TUESDAY' THEN 2
		WHEN 'WEDNESDAY' THEN 3
		WHEN 'THURSDAY' THEN 4
		WHEN 'FRIDAY' THEN 5
		WHEN 'SATURDAY' THEN 6
		WHEN 'SUNDAY' THEN 7
	END, s.time;
*/

#line 56 "schedule.sqc"


   
/*
EXEC SQL OPEN schedule;
*/

{
#line 58 "schedule.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 58 "schedule.sqc"
  sqlaaloc(2,2,2,0L);
    {
      struct sqla_setdata_list sql_setdlist[2];
#line 58 "schedule.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 20;
#line 58 "schedule.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 58 "schedule.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 58 "schedule.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 20;
#line 58 "schedule.sqc"
      sql_setdlist[1].sqldata = (void*)SIN;
#line 58 "schedule.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 58 "schedule.sqc"
      sqlasetdata(2,0,2,sql_setdlist,0L,0L);
    }
#line 58 "schedule.sqc"
  sqlacall((unsigned short)26,1,2,0,0L);
#line 58 "schedule.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 58 "schedule.sqc"
  sqlastop(0L);
}

#line 58 "schedule.sqc"

   
/*
EXEC SQL WHENEVER NOT FOUND GO TO end;
*/

#line 59 "schedule.sqc"



   
/*
EXEC SQL FETCH schedule INTO :cnum,:cname, :term, :section, :day, :time, :room, :name;
*/

{
#line 62 "schedule.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 62 "schedule.sqc"
  sqlaaloc(3,8,3,0L);
    {
      struct sqla_setdata_list sql_setdlist[8];
#line 62 "schedule.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 62 "schedule.sqc"
      sql_setdlist[0].sqldata = (void*)cnum;
#line 62 "schedule.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 62 "schedule.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 50;
#line 62 "schedule.sqc"
      sql_setdlist[1].sqldata = (void*)cname;
#line 62 "schedule.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 62 "schedule.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 62 "schedule.sqc"
      sql_setdlist[2].sqldata = (void*)term;
#line 62 "schedule.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 62 "schedule.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 62 "schedule.sqc"
      sql_setdlist[3].sqldata = (void*)&section;
#line 62 "schedule.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 62 "schedule.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 10;
#line 62 "schedule.sqc"
      sql_setdlist[4].sqldata = (void*)day;
#line 62 "schedule.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 62 "schedule.sqc"
      sql_setdlist[5].sqltype = 460; sql_setdlist[5].sqllen = 5;
#line 62 "schedule.sqc"
      sql_setdlist[5].sqldata = (void*)time;
#line 62 "schedule.sqc"
      sql_setdlist[5].sqlind = 0L;
#line 62 "schedule.sqc"
      sql_setdlist[6].sqltype = 460; sql_setdlist[6].sqllen = 7;
#line 62 "schedule.sqc"
      sql_setdlist[6].sqldata = (void*)room;
#line 62 "schedule.sqc"
      sql_setdlist[6].sqlind = 0L;
#line 62 "schedule.sqc"
      sql_setdlist[7].sqltype = 460; sql_setdlist[7].sqllen = 30;
#line 62 "schedule.sqc"
      sql_setdlist[7].sqldata = (void*)name;
#line 62 "schedule.sqc"
      sql_setdlist[7].sqlind = 0L;
#line 62 "schedule.sqc"
      sqlasetdata(3,0,8,sql_setdlist,0L,0L);
    }
#line 62 "schedule.sqc"
  sqlacall((unsigned short)25,1,0,3,0L);
#line 62 "schedule.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 62 "schedule.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 62 "schedule.sqc"
  sqlastop(0L);
}

#line 62 "schedule.sqc"

i=1;
   printf("Schedule for \"%s\" (%s) and term <%s>\n", name,SIN,term );
   printf("----\n");
   printf("%s: \t \"%s\" \t (%s) \t  %i \t %s \t  %s\n", day,cname,cnum,section,time,room);

   for (;;) {
     
/*
EXEC SQL FETCH schedule INTO :cnum, :cname, :term, :section, :day, :time, :room, :name;
*/

{
#line 69 "schedule.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 69 "schedule.sqc"
  sqlaaloc(3,8,4,0L);
    {
      struct sqla_setdata_list sql_setdlist[8];
#line 69 "schedule.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 5;
#line 69 "schedule.sqc"
      sql_setdlist[0].sqldata = (void*)cnum;
#line 69 "schedule.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 69 "schedule.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 50;
#line 69 "schedule.sqc"
      sql_setdlist[1].sqldata = (void*)cname;
#line 69 "schedule.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 69 "schedule.sqc"
      sql_setdlist[2].sqltype = 460; sql_setdlist[2].sqllen = 3;
#line 69 "schedule.sqc"
      sql_setdlist[2].sqldata = (void*)term;
#line 69 "schedule.sqc"
      sql_setdlist[2].sqlind = 0L;
#line 69 "schedule.sqc"
      sql_setdlist[3].sqltype = 496; sql_setdlist[3].sqllen = 4;
#line 69 "schedule.sqc"
      sql_setdlist[3].sqldata = (void*)&section;
#line 69 "schedule.sqc"
      sql_setdlist[3].sqlind = 0L;
#line 69 "schedule.sqc"
      sql_setdlist[4].sqltype = 460; sql_setdlist[4].sqllen = 10;
#line 69 "schedule.sqc"
      sql_setdlist[4].sqldata = (void*)day;
#line 69 "schedule.sqc"
      sql_setdlist[4].sqlind = 0L;
#line 69 "schedule.sqc"
      sql_setdlist[5].sqltype = 460; sql_setdlist[5].sqllen = 5;
#line 69 "schedule.sqc"
      sql_setdlist[5].sqldata = (void*)time;
#line 69 "schedule.sqc"
      sql_setdlist[5].sqlind = 0L;
#line 69 "schedule.sqc"
      sql_setdlist[6].sqltype = 460; sql_setdlist[6].sqllen = 7;
#line 69 "schedule.sqc"
      sql_setdlist[6].sqldata = (void*)room;
#line 69 "schedule.sqc"
      sql_setdlist[6].sqlind = 0L;
#line 69 "schedule.sqc"
      sql_setdlist[7].sqltype = 460; sql_setdlist[7].sqllen = 30;
#line 69 "schedule.sqc"
      sql_setdlist[7].sqldata = (void*)name;
#line 69 "schedule.sqc"
      sql_setdlist[7].sqlind = 0L;
#line 69 "schedule.sqc"
      sqlasetdata(3,0,8,sql_setdlist,0L,0L);
    }
#line 69 "schedule.sqc"
  sqlacall((unsigned short)25,1,0,3,0L);
#line 69 "schedule.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 69 "schedule.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 69 "schedule.sqc"
  sqlastop(0L);
}

#line 69 "schedule.sqc"

     printf("%s: \t \"%s\" \t (%s) \t  %i \t %s \t  %s\n", day,cname,cnum,section,time,room);
     };
	
	end:
		if(i==0){
			printf("Schedule for (%s) does not exist.\n", SIN);
		}
		printf("----\n");
		
/*
EXEC SQL CLOSE schedule;
*/

{
#line 78 "schedule.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 78 "schedule.sqc"
  sqlacall((unsigned short)20,1,0,0,0L);
#line 78 "schedule.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 78 "schedule.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 78 "schedule.sqc"
  sqlastop(0L);
}

#line 78 "schedule.sqc"

	};

//   EXEC SQL CLOSE schedule;
   
/*
EXEC SQL COMMIT;
*/

{
#line 82 "schedule.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 82 "schedule.sqc"
  sqlacall((unsigned short)21,0,0,0,0L);
#line 82 "schedule.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 82 "schedule.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 82 "schedule.sqc"
  sqlastop(0L);
}

#line 82 "schedule.sqc"

   
/*
EXEC SQL CONNECT RESET;
*/

{
#line 83 "schedule.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 83 "schedule.sqc"
  sqlacall((unsigned short)29,3,0,0,0L);
#line 83 "schedule.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 83 "schedule.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 83 "schedule.sqc"
  sqlastop(0L);
}

#line 83 "schedule.sqc"

   exit(0);


error:
//   check_error("My error",&sqlca);
   
/*
EXEC SQL WHENEVER SQLERROR CONTINUE;
*/

#line 89 "schedule.sqc"


   
/*
EXEC SQL ROLLBACK;
*/

{
#line 91 "schedule.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 91 "schedule.sqc"
  sqlacall((unsigned short)28,0,0,0,0L);
#line 91 "schedule.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 91 "schedule.sqc"
  sqlastop(0L);
}

#line 91 "schedule.sqc"

   
/*
EXEC SQL CONNECT reset;
*/

{
#line 92 "schedule.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 92 "schedule.sqc"
  sqlacall((unsigned short)29,3,0,0,0L);
#line 92 "schedule.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 92 "schedule.sqc"
  sqlastop(0L);
}

#line 92 "schedule.sqc"

   exit(1);

}
