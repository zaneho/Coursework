static char sqla_program_id[292] = 
{
 172,0,65,69,65,85,65,73,82,65,115,56,76,74,76,106,48,49,49,49,
 49,32,50,32,32,32,32,32,32,32,32,32,8,0,90,52,72,79,32,32,
 32,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,8,0,71,80,65,32,32,32,32,32,0,0,0,0,0,0,0,0,
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


#line 1 "gpa.sqc"
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


#line 7 "gpa.sqc"
 


/*
EXEC SQL BEGIN DECLARE SECTION;
*/

#line 9 "gpa.sqc"

   char db[6] = "cs348";
   char SIN[30];

   char term[3],name[30];
   double GPA, CGPA;
   short ind,ind2;

/*
EXEC SQL END DECLARE SECTION;
*/

#line 16 "gpa.sqc"


int main(int argc, char *argv[]) {
   if (argc!=2) {
      printf("Usage: sqc <pattern>\n");
      exit(1);
   };


   
/*
EXEC SQL WHENEVER SQLERROR  GO TO error;
*/

#line 25 "gpa.sqc"


   
/*
EXEC SQL CONNECT TO :db;
*/

{
#line 27 "gpa.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 27 "gpa.sqc"
  sqlaaloc(2,1,1,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 27 "gpa.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 6;
#line 27 "gpa.sqc"
      sql_setdlist[0].sqldata = (void*)db;
#line 27 "gpa.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 27 "gpa.sqc"
      sqlasetdata(2,0,1,sql_setdlist,0L,0L);
    }
#line 27 "gpa.sqc"
  sqlacall((unsigned short)29,4,2,0,0L);
#line 27 "gpa.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 27 "gpa.sqc"
  sqlastop(0L);
}

#line 27 "gpa.sqc"


   strncpy(SIN,argv[1],20);

   
/*
EXEC SQL Select sname INTO :name INDICATOR :ind
		FROM student
		WHERE snum=:SIN;
*/

{
#line 33 "gpa.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 33 "gpa.sqc"
  sqlaaloc(2,1,2,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 33 "gpa.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 30;
#line 33 "gpa.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 33 "gpa.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 33 "gpa.sqc"
      sqlasetdata(2,0,1,sql_setdlist,0L,0L);
    }
#line 33 "gpa.sqc"
  sqlaaloc(3,1,3,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 33 "gpa.sqc"
      sql_setdlist[0].sqltype = 461; sql_setdlist[0].sqllen = 30;
#line 33 "gpa.sqc"
      sql_setdlist[0].sqldata = (void*)name;
#line 33 "gpa.sqc"
      sql_setdlist[0].sqlind = &ind;
#line 33 "gpa.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 33 "gpa.sqc"
  sqlacall((unsigned short)24,1,2,3,0L);
#line 33 "gpa.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 33 "gpa.sqc"
  sqlastop(0L);
}

#line 33 "gpa.sqc"

   
  
/*
EXEC SQL 
	SELECT round(sum(GPA)/count(term),1) as CGPA INTO :CGPA INDICATOR :ind2
	FROM 
	(SELECT q1.term, q1.sum, q2.count, round(q1.sum/q2.count,1) as GPA 
		FROM 
		(SELECT term, CAST(sum(grade) AS decimal) as sum FROM MARK 
		WHERE snum=:SIN
		GROUP BY term) as q1 
	INNER JOIN 
		(SELECT term, CAST(count(snum) AS decimal) as count FROM MARK 
		WHERE snum=:SIN
		GROUP BY term) as q2 
	ON q1.term=q2.term 
	ORDER BY substr(term,2,2), 
		CASE substr(term,1,1) 
			WHEN 'W' THEN 1 
			WHEN 'S' THEN 2 
			WHEN 'F' THEN 3 
	END );
*/

{
#line 53 "gpa.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 53 "gpa.sqc"
  sqlaaloc(2,2,4,0L);
    {
      struct sqla_setdata_list sql_setdlist[2];
#line 53 "gpa.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 30;
#line 53 "gpa.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 53 "gpa.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 53 "gpa.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 30;
#line 53 "gpa.sqc"
      sql_setdlist[1].sqldata = (void*)SIN;
#line 53 "gpa.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 53 "gpa.sqc"
      sqlasetdata(2,0,2,sql_setdlist,0L,0L);
    }
#line 53 "gpa.sqc"
  sqlaaloc(3,1,5,0L);
    {
      struct sqla_setdata_list sql_setdlist[1];
#line 53 "gpa.sqc"
      sql_setdlist[0].sqltype = 481; sql_setdlist[0].sqllen = 8;
#line 53 "gpa.sqc"
      sql_setdlist[0].sqldata = (void*)&CGPA;
#line 53 "gpa.sqc"
      sql_setdlist[0].sqlind = &ind2;
#line 53 "gpa.sqc"
      sqlasetdata(3,0,1,sql_setdlist,0L,0L);
    }
#line 53 "gpa.sqc"
  sqlacall((unsigned short)24,2,2,3,0L);
#line 53 "gpa.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 53 "gpa.sqc"
  sqlastop(0L);
}

#line 53 "gpa.sqc"


if(ind>=0 && ind2>=0){
   printf("GPA for student \"%s\" (%s) is %.1f\n",name,SIN,CGPA);

   
/*
EXEC SQL DECLARE gpa CURSOR FOR 
	SELECT q1.term, round(q1.sum/q2.count,1) as GPA 
	FROM 
		(SELECT term, CAST(sum(grade) AS decimal) as sum FROM MARK 
		WHERE snum=:SIN
		GROUP BY term) as q1 
	INNER JOIN 
		(SELECT term, CAST(count(snum) AS decimal) as count FROM MARK 
		WHERE snum=:SIN
		GROUP BY term) as q2 
	ON q1.term=q2.term 
	ORDER BY substr(term,2,2), 
		CASE substr(term,1,1) 
			WHEN 'W' THEN 1 
			WHEN 'S' THEN 2 
			WHEN 'F' THEN 3 
		END;
*/

#line 74 "gpa.sqc"


   
/*
EXEC SQL OPEN gpa;
*/

{
#line 76 "gpa.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 76 "gpa.sqc"
  sqlaaloc(2,2,6,0L);
    {
      struct sqla_setdata_list sql_setdlist[2];
#line 76 "gpa.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 30;
#line 76 "gpa.sqc"
      sql_setdlist[0].sqldata = (void*)SIN;
#line 76 "gpa.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 76 "gpa.sqc"
      sql_setdlist[1].sqltype = 460; sql_setdlist[1].sqllen = 30;
#line 76 "gpa.sqc"
      sql_setdlist[1].sqldata = (void*)SIN;
#line 76 "gpa.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 76 "gpa.sqc"
      sqlasetdata(2,0,2,sql_setdlist,0L,0L);
    }
#line 76 "gpa.sqc"
  sqlacall((unsigned short)26,3,2,0,0L);
#line 76 "gpa.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 76 "gpa.sqc"
  sqlastop(0L);
}

#line 76 "gpa.sqc"

   
/*
EXEC SQL WHENEVER NOT FOUND GO TO end;
*/

#line 77 "gpa.sqc"

   for (;;) {
     
/*
EXEC SQL FETCH gpa INTO :term, :GPA;
*/

{
#line 79 "gpa.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 79 "gpa.sqc"
  sqlaaloc(3,2,7,0L);
    {
      struct sqla_setdata_list sql_setdlist[2];
#line 79 "gpa.sqc"
      sql_setdlist[0].sqltype = 460; sql_setdlist[0].sqllen = 3;
#line 79 "gpa.sqc"
      sql_setdlist[0].sqldata = (void*)term;
#line 79 "gpa.sqc"
      sql_setdlist[0].sqlind = 0L;
#line 79 "gpa.sqc"
      sql_setdlist[1].sqltype = 480; sql_setdlist[1].sqllen = 8;
#line 79 "gpa.sqc"
      sql_setdlist[1].sqldata = (void*)&GPA;
#line 79 "gpa.sqc"
      sql_setdlist[1].sqlind = 0L;
#line 79 "gpa.sqc"
      sqlasetdata(3,0,2,sql_setdlist,0L,0L);
    }
#line 79 "gpa.sqc"
  sqlacall((unsigned short)25,3,0,3,0L);
#line 79 "gpa.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 79 "gpa.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 79 "gpa.sqc"
  sqlastop(0L);
}

#line 79 "gpa.sqc"

     printf("%s %.1f\n",term,GPA);
     };

   
/*
EXEC SQL CLOSE gpa;
*/

{
#line 83 "gpa.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 83 "gpa.sqc"
  sqlacall((unsigned short)20,3,0,0,0L);
#line 83 "gpa.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 83 "gpa.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 83 "gpa.sqc"
  sqlastop(0L);
}

#line 83 "gpa.sqc"

}else{
	printf("User (%s) not found.\n", SIN);
}

end:


   
/*
EXEC SQL COMMIT;
*/

{
#line 91 "gpa.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 91 "gpa.sqc"
  sqlacall((unsigned short)21,0,0,0,0L);
#line 91 "gpa.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 91 "gpa.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 91 "gpa.sqc"
  sqlastop(0L);
}

#line 91 "gpa.sqc"

   
/*
EXEC SQL CONNECT RESET;
*/

{
#line 92 "gpa.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 92 "gpa.sqc"
  sqlacall((unsigned short)29,3,0,0,0L);
#line 92 "gpa.sqc"
  if (sqlca.sqlcode < 0)
  {
    sqlastop(0L);
    goto error;
  }
#line 92 "gpa.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 92 "gpa.sqc"
  sqlastop(0L);
}

#line 92 "gpa.sqc"

   exit(0);

error:
  // check_error("My error",&sqlca);
   
/*
EXEC SQL WHENEVER SQLERROR CONTINUE;
*/

#line 97 "gpa.sqc"


   
/*
EXEC SQL ROLLBACK;
*/

{
#line 99 "gpa.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 99 "gpa.sqc"
  sqlacall((unsigned short)28,0,0,0,0L);
#line 99 "gpa.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 99 "gpa.sqc"
  sqlastop(0L);
}

#line 99 "gpa.sqc"

   
/*
EXEC SQL CONNECT reset;
*/

{
#line 100 "gpa.sqc"
  sqlastrt(sqla_program_id, &sqla_rtinfo, &sqlca);
#line 100 "gpa.sqc"
  sqlacall((unsigned short)29,3,0,0,0L);
#line 100 "gpa.sqc"
  if (sqlca.sqlcode == 100)
  {
    sqlastop(0L);
    goto end;
  }
#line 100 "gpa.sqc"
  sqlastop(0L);
}

#line 100 "gpa.sqc"

   exit(1);
}
