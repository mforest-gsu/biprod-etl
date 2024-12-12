truncate table D2L_OUTCOMES_ALIGNED_OBJECT;

insert into D2L_OUTCOMES_ALIGNED_OBJECT
  (AlignedObjectType, AlignedObjectId)
select
  AlignedObjectType,
  AlignedObjectId
from
  d2l_outcomes_demonstration
where
  AlignedObjectType in (1,2,3,5)
group by
  AlignedObjectType,
  AlignedObjectId
;

commit;

quit;
