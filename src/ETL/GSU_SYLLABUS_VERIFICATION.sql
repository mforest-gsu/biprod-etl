MERGE INTO
  GSU_SYLLABUS_VERIFICATION A
USING
  GSU_SYLLABUS_VERIFICATION_LOAD B
ON
  (
    A.SeqNum = B.SeqNum
  )
WHEN MATCHED THEN
  UPDATE SET
    A.TermCode = B.TermCode,
    A.TermDescription = B.TermDescription,
    A.CollegeCode = B.CollegeCode,
    A.CollegeDescription = B.CollegeDescription,
    A.DepartmentCode = B.DepartmentCode,
    A.DepartmentDescription = B.DepartmentDescription,
    A.CRN = B.CRN,
    A.SubjectCode = B.SubjectCode,
    A.CourseNumber = B.CourseNumber,
    A.SequenceNumber = B.SequenceNumber,
    A.CourseTitle = B.CourseTitle,
    A.InstructorFirstName = B.InstructorFirstName,
    A.InstructorLastName = B.InstructorLastName,
    A.InstructorEmail = B.InstructorEmail,
    A.VerifyStatus = B.VerifyStatus,
    A.VerifyDate = B.VerifyDate,
    A.VerifyUser = B.VerifyUser
  WHERE
    NVL(A.TermCode, 0) != NVL(B.TermCode, 0) OR
    NVL(A.TermDescription, 0) != NVL(B.TermDescription, 0) OR
    NVL(A.CollegeCode, 0) != NVL(B.CollegeCode, 0) OR
    NVL(A.CollegeDescription, 0) != NVL(B.CollegeDescription, 0) OR
    NVL(A.DepartmentCode, 0) != NVL(B.DepartmentCode, 0) OR
    NVL(A.DepartmentDescription, 0) != NVL(B.DepartmentDescription, 0) OR
    NVL(A.CRN, 0) != NVL(B.CRN, 0) OR
    NVL(A.SubjectCode, 0) != NVL(B.SubjectCode, 0) OR
    NVL(A.CourseNumber, 0) != NVL(B.CourseNumber, 0) OR
    NVL(A.SequenceNumber, 0) != NVL(B.SequenceNumber, 0) OR
    NVL(A.CourseTitle, 0) != NVL(B.CourseTitle, 0) OR
    NVL(A.InstructorFirstName, 0) != NVL(B.InstructorFirstName, 0) OR
    NVL(A.InstructorLastName, 0) != NVL(B.InstructorLastName, 0) OR
    NVL(A.InstructorEmail, 0) != NVL(B.InstructorEmail, 0) OR
    NVL(A.VerifyStatus, 0) != NVL(B.VerifyStatus, 0) OR
    NVL(A.VerifyDate, SYSDATE) != NVL(B.VerifyDate, SYSDATE) OR
    NVL(A.VerifyUser, 0) != NVL(B.VerifyUser, 0)
WHEN NOT MATCHED THEN
  INSERT
    (
      A.SeqNum,
      A.TermCode,
      A.TermDescription,
      A.CollegeCode,
      A.CollegeDescription,
      A.DepartmentCode,
      A.DepartmentDescription,
      A.CRN,
      A.SubjectCode,
      A.CourseNumber,
      A.SequenceNumber,
      A.CourseTitle,
      A.InstructorFirstName,
      A.InstructorLastName,
      A.InstructorEmail,
      A.VerifyStatus,
      A.VerifyDate,
      A.VerifyUser
    )
  VALUES
    (
      B.SeqNum,
      B.TermCode,
      B.TermDescription,
      B.CollegeCode,
      B.CollegeDescription,
      B.DepartmentCode,
      B.DepartmentDescription,
      B.CRN,
      B.SubjectCode,
      B.CourseNumber,
      B.SequenceNumber,
      B.CourseTitle,
      B.InstructorFirstName,
      B.InstructorLastName,
      B.InstructorEmail,
      B.VerifyStatus,
      B.VerifyDate,
      B.VerifyUser
    )
;

DELETE FROM
  GSU_SYLLABUS_VERIFICATION
WHERE
  NOT EXISTS (
    SELECT
      1
    FROM
      GSU_SYLLABUS_VERIFICATION_LOAD
    WHERE
      GSU_SYLLABUS_VERIFICATION_LOAD.SeqNum = GSU_SYLLABUS_VERIFICATION.SeqNum
  )
;

COMMIT;

QUIT;
