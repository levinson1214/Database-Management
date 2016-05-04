SELECT DISTINCT s.shiftID,
       m.shiftID,
       g.shiftID,
       sh.startTime,
       sh.endTime,
       b.timeBreakStarts,
       b.timeBreakEnds
FROM   shifts sh,
       shifts shh,
       shifts shhh,
       salesAssociate s,
       manager m,
       GM g,
       breakAssignments b
WHERE  b.shiftID = sh.shiftID
  AND  s.shiftID = shh.shiftID
  AND  m.shiftID = shhh.shiftID
  AND  g.shiftID = sh.shiftID
ORDER BY sh.startTime ASC;