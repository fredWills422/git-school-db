drop database if exists school_db;
create database school_db;
use school_db;

create table Course(
CourseID             int               primary key auto_increment,
Subject              varchar  (50)     not null,
Name                 varchar  (50)     not null,
InstructorFN         varchar  (50)     not null,
InstructorLN         varchar  (50)     not null,
Number_Of_Students_Enrolled   int      not null default 0
);

insert Course (CourseID, Subject, Name, InstructorFN, InstructorLN, Number_Of_Students_Enrolled) values(1, 'Math', 'Calculus', 'Kevin', 'Johnson', 1);
insert Course (CourseID, Subject, Name, InstructorFN, InstructorLN, Number_Of_Students_Enrolled) values(2, 'Science', 'Biochemistry', 'Loretta', 'DaVinci', 2);
insert Course (CourseID, Subject, Name, InstructorFN, InstructorLN, Number_Of_Students_Enrolled) values(3, 'Art', 'Photography', 'Chris', 'Davenport', 0);
insert Course (CourseID, Subject, Name, InstructorFN, InstructorLN, Number_Of_Students_Enrolled) values(4, 'Math', 'Trigonometry', 'Christina', 'Davenport', 1);

create table Student(
StudentID      int                     primary key auto_increment,
CourseID       int                     not null,
foreign key (CourseID) references Course(CourseID),
FirstName      varchar    (25)         not null,
LastName       varchar    (25)         not null,
City           varchar    (50)         not null,
State          varchar    (2)          not null,  
Birthdate      date                    not null,
Zip            int                     not null,
Phone          varchar    (12)         not null,
Email          varchar    (50)         not null,
SSN            varchar    (11)         not null unique
);

insert Student (StudentID, CourseID, FirstName, LastName, City, State, Birthdate, Zip, Phone, Email, SSN) values (1, 1, 'Warren', 'Jackson', 'Columbus', 'OH', '1984-7-11', 47139, '414-817-2935', 'wajay22@gmail.com', '276-63-2956');
insert Student (StudentID, CourseID, FirstName, LastName, City, State, Birthdate, Zip, Phone, Email, SSN) values (2, 2, 'Issac', 'Hunter', 'Philadelphia', 'PA', '1976-2-16', 51745, '585-382-7065', 'issac4mphilly@gmail.com', '361-38-7043');
insert Student (StudentID, CourseID, FirstName, LastName, City, State, Birthdate, Zip, Phone, Email, SSN) values (3, 2, 'Michelle', 'Williamson', 'Cincinnati', 'OH', '1988-6-02', 45224, '513-817-4631', 'chelleshocked@gmail.com', '300-49-6443');
insert Student (StudentID, CourseID, FirstName, LastName, City, State, Birthdate, Zip, Phone, Email, SSN) values (4, 4, 'April', 'Walker', 'Livingston', 'KY', '1976-4-13', 53758, '917-817-2935', 'ajaywalker@gmail.com', '299-83-4636');

create table Enrollment( 
EnrollmentID                      int            primary key auto_increment,
StudentID                         int            not null,
foreign key (StudentID) references Student(StudentID),
CourseID                          int            not null,
foreign key (CourseID)  references Course(CourseID),
CONSTRAINT  std_course  unique (StudentID, CourseID),
FirstQuarterGrade                 varchar  (1)   not null,
SecondQuarterGrade                varchar  (1)   not null,
ThirdQuarterGrade                 varchar  (1)   not null,
FourthQuarterGrade                varchar  (1)   not null
);

insert Enrollment(EnrollmentID, StudentID, CourseID, FirstQuarterGrade, SecondQuarterGrade, ThirdQuarterGrade, FourthQuarterGrade) values(1, '1', '1', 'A','A','A','C');
insert Enrollment(EnrollmentID, StudentID, CourseID, FirstQuarterGrade, SecondQuarterGrade, ThirdQuarterGrade, FourthQuarterGrade) values(2, '2', '2', 'B','A','B','B');
insert Enrollment(EnrollmentID, StudentID, CourseID, FirstQuarterGrade, SecondQuarterGrade, ThirdQuarterGrade, FourthQuarterGrade) values(3, '3', '2', 'C','A','A','A');
insert Enrollment(EnrollmentID, StudentID, CourseID, FirstQuarterGrade, SecondQuarterGrade, ThirdQuarterGrade, FourthQuarterGrade) values(4, '4', '4', 'A','B','A','A');

select * from Course;
select * from Student;
select * from Enrollment;

select * from Course
	join Student
    on Course.CourseID = Student.CourseID;
    
select Enrollment.StudentID, Enrollment.CourseID
	from Enrollment, Student, Course
	where Enrollment.StudentID = Student.StudentID and Enrollment.CourseID = Course.CourseID;

select * from Course, Student, Enrollment
    where Enrollment.StudentID = Student.StudentID and Enrollment.CourseID = Course.CourseID;

select sum(Number_Of_Students_Enrolled) from Course;

select count(Subject) from Course
	where Subject = 'Math';    

select avg (Number_Of_Students_Enrolled) from Course;

select max(Number_Of_Students_Enrolled) from Course;

select min(Number_Of_Students_Enrolled) from Course;

select Birthdate
	from Student
	order by Birthdate desc;

select Subject , sum(Number_Of_Students_Enrolled)
	from Course
	group by Number_Of_Students_Enrolled;