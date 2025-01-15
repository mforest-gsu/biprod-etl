LOAD DATA
TRUNCATE INTO TABLE MFOREST.GSU_SYLLABUS_VERIFICATION_LOAD
REPLACE
FIELDS TERMINATED BY ","
OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
    SeqNum                  INTEGER EXTERNAL(10),
    TermCode                CHAR(6),
    TermDescription         CHAR(64),
    CollegeCode             CHAR(4),
    CollegeDescription      CHAR(64),
    DepartmentCode          CHAR(4),
    DepartmentDescription   CHAR(64),
    CRN                     CHAR(5),
    SubjectCode             CHAR(4),
    CourseNumber            CHAR(5),
    SequenceNumber          CHAR(3),
    CourseTitle             CHAR(64),
    InstructorFirstName     CHAR(120),
    InstructorLastName      CHAR(120),
    InstructorEmail         CHAR(30),
    VerifyStatus            CHAR(10),
    VerifyDate              DATE 'yyyy-mm-dd hh24:mi:ss',
    VerifyUser              CHAR(30)
)
