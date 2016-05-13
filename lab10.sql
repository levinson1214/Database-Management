--Lab 10
--Jacob Levinson

-- The table of courses.
create table Courses (
    num      integer not null,
    name     text    not null,
    credits  integer not null,
  primary key (num)
);


insert into Courses(num, name, credits)
values (499, 'CS/ITS Capping', 3 );

insert into Courses(num, name, credits)
values (308, 'Database Systems', 4 );

insert into Courses(num, name, credits)
values (221, 'Software Development Two', 4 );

insert into Courses(num, name, credits)
values (220, 'Software Development One', 4 );

insert into Courses(num, name, credits)
values (120, 'Introduction to Programming', 4);

select * 
from courses
order by num ASC;


--
-- Courses and their prerequisites
--
create table Prerequisites (
    courseNum integer not null references Courses(num),
    preReqNum integer not null references Courses(num),
  primary key (courseNum, preReqNum)
);

insert into Prerequisites(courseNum, preReqNum)
values (499, 308);

insert into Prerequisites(courseNum, preReqNum)
values (499, 221);

insert into Prerequisites(courseNum, preReqNum)
values (308, 120);

insert into Prerequisites(courseNum, preReqNum)
values (221, 220);

insert into Prerequisites(courseNum, preReqNum)
values (220, 120);

select *
from Prerequisites
order by courseNum DESC;

--1. Function PreReqsFor(courseNum)

create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as
$$
declare
	courseNumber int       := $1;
	resultset   REFCURSOR := $2;
begin
	open resultset for
		select courseNum, preReqNum
		from Prerequisites, Courses
		where num = PreReqNum
		and courseNumber = courseNum;
	return resultset;
end;
$$
language plpgsql;

SELECT PreReqsFor(499, 'results');
FETCH ALL FROM results;



--2. Function IsRegFor(courseNum) 


create or replace function IsPreReqsFor(int, REFCURSOR) returns refcursor as
$$
declare
	courseNumber int       := $1;
	resultset   REFCURSOR := $2;
begin
	open resultset for
		select preReqNum, courseNum
		from Prerequisites, Courses
		where courseNum = num
		and courseNumber = PreReqNum;
	return resultset;
end;
$$
language plpgsql;

SELECT IsPreReqsFor(220, 'results');
FETCH ALL FROM results;