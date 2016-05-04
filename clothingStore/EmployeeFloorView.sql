CREATE VIEW employeeFloor AS
   SELECT em.lastName,
          em.firstName,
          f.name AS floor
   FROM   employee em,
          salesAssociate s,
          manager m,
          gm g,
          floor f
   WHERE  em.id = s.sid
     AND  em.id = m.mid
     AND  em.id = g.gid
     AND  f.fid = s.fid
     AND  f.fid = m.fid
     AND  f.fid = g.fid
   ORDER BY f.fid DESC  