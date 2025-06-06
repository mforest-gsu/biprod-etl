
TRUNCATE TABLE ICOLLPRD.LMSENRL;
INSERT INTO ICOLLPRD.LMSENRL
  (
    LMSENRL_PIDM,
    LMSENRL_TERM_CODE,
    LMSENRL_CRN,
    LMSENRL_SUBJ_CRSE,
    LMSENRL_XLS_CODE,
    LMSENRL_DEPT_CODE,
    LMSENRL_ENROLLMENT_DATE,
    LMSENRL_LAST_ACCESSED,
    LMSENRL_COURSE_ID,
    LMSENRL_COURSE_CODE,
    LMSENRL_COURSE_NAME,
    LMSENRL_COURSE_IS_ACTIVE,
    LMSENRL_COURSE_IS_DELETED,
    LMSENRL_SECTION_ID,
    LMSENRL_SECTION_CODE,
    LMSENRL_SECTION_NAME,
    LMSENRL_SECTION_IS_ACTIVE,
    LMSENRL_SECTION_IS_DELETED,
    LMSENRL_STUDENT_ID,
    LMSENRL_STUDENT_USERNAME,
    LMSENRL_STUDENT_FIRST_NAME,
    LMSENRL_STUDENT_LAST_NAME,
    LMSENRL_STUDENT_AFFILIATIONS,
    LMSENRL_ENROLLEDBY_ID,
    LMSENRL_ENROLLEDBY_USERNAME,
    LMSENRL_ENROLLEDBY_FIRST_NAME,
    LMSENRL_ENROLLEDBY_LAST_NAME,
    LMSENRL_ENROLLEDBY_AFFILIATIONS
  )
SELECT
  LMSENRL_PIDM,
  LMSENRL_TERM_CODE,
  LMSENRL_CRN,
  LMSENRL_SUBJ_CRSE,
  LMSENRL_XLS_CODE,
  LMSENRL_DEPT_CODE,
  LMSENRL_ENROLLMENT_DATE,
  LMSENRL_LAST_ACCESSED,
  LMSENRL_COURSE_ID,
  LMSENRL_COURSE_CODE,
  LMSENRL_COURSE_NAME,
  LMSENRL_COURSE_IS_ACTIVE,
  LMSENRL_COURSE_IS_DELETED,
  LMSENRL_SECTION_ID,
  LMSENRL_SECTION_CODE,
  LMSENRL_SECTION_NAME,
  LMSENRL_SECTION_IS_ACTIVE,
  LMSENRL_SECTION_IS_DELETED,
  LMSENRL_STUDENT_ID,
  LMSENRL_STUDENT_USERNAME,
  LMSENRL_STUDENT_FIRST_NAME,
  LMSENRL_STUDENT_LAST_NAME,
  LMSENRL_STUDENT_AFFILIATIONS,
  LMSENRL_ENROLLEDBY_ID,
  LMSENRL_ENROLLEDBY_USERNAME,
  LMSENRL_ENROLLEDBY_FIRST_NAME,
  LMSENRL_ENROLLEDBY_LAST_NAME,
  LMSENRL_ENROLLEDBY_AFFILIATIONS
FROM
  MFOREST.LMSENRL
;

COMMIT;

QUIT;
