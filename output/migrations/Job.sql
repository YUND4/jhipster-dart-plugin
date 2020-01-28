CREATE TABLE Job ( 
    id  INTEGER PRIMARY KEY,
    idRemoto  INTEGER,
    imagenesSync BOOLEAN,
    jobTitle TEXT ,
    minSalary INTEGER ,
    maxSalary INTEGER ,
    date TIMESTAMP ,
    exist BOOLEAN ,
  );
