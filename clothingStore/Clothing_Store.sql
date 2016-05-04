CREATE TABLE employee(
   id           SERIAL,
   firstName    text NOT NULL,
   lastName     text NOT NULL,
   phoneNumber  bigint NOT NULL,
   salary       REAL NOT NULL,
 PRIMARY KEY(id)
);

CREATE TABLE floor(
   fid          SERIAL,
   name         text NOT NULL,
 PRIMARY KEY(fid)
);

CREATE TABLE shifts(
   shiftID      int NOT NULL,
   startTime    time NOT NULL,
   endTime      time NOT NULL,
 PRIMARY KEY(shiftID)
);

CREATE TABLE daysOfWork(
   shiftID      int NOT NULL,
   dayOfWeek    text NOT NULL CHECK
      (dayOfWeek in ('Sunday','Monday','Tuesday','Wednesday',
                     'Thursday','Friday','Saturday')),
 PRIMARY KEY(shiftID, dayOfWeek)
);

CREATE TABLE breakAssignments(
   shiftID      int NOT NULL REFERENCES shifts(shiftID),
   timeBreakStarts  time NOT NULL,
   timeBreakEnds    time NOT NULL,
 PRIMARY KEY(shiftID)
);

CREATE TABLE salesAssociate(
   sid          int NOT NULL REFERENCES employee(id),
   fid          int NOT NULL REFERENCES floor(fid),
   shiftID      int NOT NULL REFERENCES shifts(shiftID),
 PRIMARY KEY(sid)
);

CREATE TABLE manager(
   mid          int NOT NULL REFERENCES employee(id),
   fid          int NOT NULL REFERENCES floor(fid),
   shiftID      int NOT NULL REFERENCES shifts(shiftID),
 PRIMARY KEY(mid)
);

CREATE TABLE GM(
   gid          int NOT NULL REFERENCES employee(id),
   fid          int NOT NULL REFERENCES floor(fid),
   shiftID      int NOT NULL REFERENCES shifts(shiftID),
 PRIMARY KEY(gid)
);

INSERT INTO employee (firstName, lastName, phoneNumber, salary) VALUES
    ('Jacob', 'Levinson', 1234567890, 15.50),
    ('Jeannie', 'Baez', 9876543210, 25.00),
    ('Chris', 'Siena', 9146583921, 15.00),
    ('Julia', 'Santiago', 2013855349, 10.00),
    ('James', 'Ambrose', 7325961283, 9.00),
    ('Eric', 'Hogan', 9465437829, 9.00),
    ('Matthew', 'Blades', 1435986324, 9.00),
    ('Ted', 'Dolce', 9874656782, 12.00),
    ('Herminio', 'Baez', 6468363998, 20.00),
    ('Cam', 'Smith', 3452589435, 14.00);

INSERT INTO floor (name) VALUES
    ('Basement'),
    ('Ground Floor'),
    ('Second Floor'),
    ('Third Floor');

INSERT INTO shifts (shiftID, startTime, endTime) VALUES
    (1, '09:00:00', '15:00:00'),
    (2, '11:00:00', '17:00:00'),
    (3, '13:00:00', '19:00:00'),
    (4, '15:00:00', '21:00:00'),
    (5, '17:00:00', '23:00:00'),
    (6, '21:00:00', '03:00:00');

INSERT INTO daysOfWork (shiftID, dayOfWeek) VALUES
    (1, 'Monday'),
    (1, 'Tuesday'),
    (1, 'Wednesday'),
    (1, 'Thursday'),
    (1, 'Friday'),
    (1, 'Saturday'),
    (1, 'Sunday'),
    (2, 'Monday'),
    (2, 'Tuesday'),
    (2, 'Wednesday'),
    (2, 'Thursday'),
    (2, 'Friday'),
    (2, 'Saturday'),
    (2, 'Sunday'),
    (3, 'Monday'),
    (3, 'Tuesday'),
    (3, 'Wednesday'),
    (3, 'Thursday'),
    (3, 'Friday'),
    (3, 'Saturday'),
    (3, 'Sunday'),
    (4, 'Monday'),
    (4, 'Tuesday'),
    (4, 'Wednesday'),
    (4, 'Thursday'),
    (4, 'Friday'),
    (4, 'Saturday'),
    (4, 'Sunday'),
    (5, 'Monday'),
    (5, 'Tuesday'),
    (5, 'Wednesday'),
    (5, 'Thursday'),
    (5, 'Friday'),
    (5, 'Saturday'),
    (5, 'Sunday'),
    (6, 'Monday'),
    (6, 'Tuesday'),
    (6, 'Wednesday'),
    (6, 'Thursday'),
    (6, 'Friday'),
    (6, 'Saturday'),
    (6, 'Sunday');

INSERT INTO breakAssignments (shiftID, timeBreakStarts, timeBreakEnds) VALUES
    (1, '12:00:00', '12:30:00'),
    (2, '14:00:00', '14:30:00'),
    (3, '16:00:00', '16:30:00'),
    (4, '18:00:00', '18:30:00'),
    (5, '20:00:00', '20:30:00'),
    (6, '00:00:00', '00:30:00');

INSERT INTO salesAssociate (sid, fid, shiftID) VALUES
    (4, 1, 4),
    (5, 2, 1),
    (6, 3, 2),
    (7, 4, 3);

INSERT INTO manager (mid, fid, shiftID) VALUES
    (1, 1, 4),
    (3, 2, 6),
    (8, 3, 1),
    (10, 4, 5);

INSERT INTO GM (gid, fid, shiftID) VALUES
    (2, 1, 4),
    (9, 2, 5);