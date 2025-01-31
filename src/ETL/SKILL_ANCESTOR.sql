truncate table MFOREST.SKILL_ANCESTOR;

INSERT INTO MFOREST.SKILL_ANCESTOR
  (
    SKILL_ANCESTOR_DETAIL_ID,
    SKILL_ANCESTOR_DETAIL_DESC,
    SKILL_ANCESTOR_PARENT1_ID,
    SKILL_ANCESTOR_PARENT1_DESC,
    SKILL_ANCESTOR_PARENT2_ID,
    SKILL_ANCESTOR_PARENT2_DESC,
    SKILL_ANCESTOR_PARENT3_ID,
    SKILL_ANCESTOR_PARENT3_DESC,
    SKILL_ANCESTOR_PARENT4_ID,
    SKILL_ANCESTOR_PARENT4_DESC,
    SKILL_ANCESTOR_PARENT5_ID,
    SKILL_ANCESTOR_PARENT5_DESC
  )
select
  Child.OutcomeId as SKILL_ANCESTOR_DETAIL_ID,
  Child.Description as SKILL_ANCESTOR_DETAIL_DESC,
  Parent1.OutcomeId SKILL_ANCESTOR_PARENT1_ID,
  Parent1.Description SKILL_ANCESTOR_PARENT1_DESC,
  Parent2.OutcomeId SKILL_ANCESTOR_PARENT2_ID,
  Parent2.Description SKILL_ANCESTOR_PARENT2_DESC,
  Parent3.OutcomeId SKILL_ANCESTOR_PARENT3_ID,
  Parent3.Description SKILL_ANCESTOR_PARENT3_DESC,
  Parent4.OutcomeId SKILL_ANCESTOR_PARENT4_ID,
  Parent4.Description SKILL_ANCESTOR_PARENT4_DESC,
  Parent5.OutcomeId SKILL_ANCESTOR_PARENT5_ID,
  Parent5.Description SKILL_ANCESTOR_PARENT5_DESC
from
  D2L_OUTCOME_DETAIL Child,
  D2L_OUTCOME_DETAIL Parent1,
  D2L_OUTCOME_DETAIL Parent2,
  D2L_OUTCOME_DETAIL Parent3,
  D2L_OUTCOME_DETAIL Parent4,
  D2L_OUTCOME_DETAIL Parent5
where
  Parent1.OutcomeId(+) = Child.ParentOutcomeId and
  Parent2.OutcomeId(+) = Parent1.ParentOutcomeId and
  Parent3.OutcomeId(+) = Parent2.ParentOutcomeId and
  Parent4.OutcomeId(+) = Parent3.ParentOutcomeId and
  Parent5.OutcomeId(+) = Parent4.ParentOutcomeId
;

commit;

quit;
