DROP TABLE GSU_SYLLABUS_VERIFICATION_LOAD;

CREATE TABLE GSU_SYLLABUS_VERIFICATION_LOAD (
  SeqNum                  NUMBER(10,0) NOT NULL,
  TermCode                VARCHAR2(6) NOT NULL,
  TermDescription         VARCHAR2(64) NOT NULL,
  CollegeCode             VARCHAR2(4) NOT NULL,
  CollegeDescription      VARCHAR2(64) NOT NULL,
  DepartmentCode          VARCHAR2(4) NOT NULL,
  DepartmentDescription   VARCHAR2(64) NOT NULL,
  CRN                     VARCHAR2(5) NOT NULL,
  SubjectCode             VARCHAR2(4) NOT NULL,
  CourseNumber            VARCHAR2(5) NOT NULL,
  SequenceNumber          VARCHAR2(3) NOT NULL,
  CourseTitle             VARCHAR2(64) NOT NULL,
  InstructorFirstName     VARCHAR2(120) DEFAULT NULL,
  InstructorLastName      VARCHAR2(120) DEFAULT NULL,
  InstructorEmail         VARCHAR2(30) DEFAULT NULL,
  VerifyStatus            VARCHAR2(10) NOT NULL,
  VerifyDate              DATE DEFAULT NULL,
  VerifyUser              VARCHAR2(30) DEFAULT NULL
);

CREATE UNIQUE INDEX IDX_GSU_SYLLABUS_VERIFICATION_LOAD_SEQNUM ON GSU_SYLLABUS_VERIFICATION_LOAD (SeqNum);

QUIT;
