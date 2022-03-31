--  SELECT woonplaats, geslacht, SUM(schoolgeld - betaald)
--  FROM student
--  GROUP BY geslacht, woonplaats
--  HAVING SUM(schoolgeld - betaald) >0;

 INSERT INTO student (studentnr, roepnaam, voorletters, tussenvoegsels, achternaam, adres, postcode, woonplaats, geslacht, telefoon, geboortedatum, schoolgeld, betaald)
 VALUES ('7777', 'Robert',' R', '',' Robertsen', 'Mozartstraat 10', '1313 DE', 'Almere', 'm', '06-9876540',' 02-02-1997',500,250);
 
UPDATE student
SET adres = 'Januaristraat 15', postcode = '1335 RT' AND woonplaats = 'Amere'
WHERE studentnr = '3232';

UPDATE student 
SET uitgeschreven = '2022-03-23'
WHERE studentnr = '2222';


SELECT DATE_FORMAT(NOW(), "%T");

SELECT DATEDIFF(NOW(), "uitgeschreven")
FROM student
WHERE studentnr = '4444';

SELECT DATEDIFF(NOW(), "1994-04-03");

SELECT geboortedatum
FROM student
WHERE achternaam = 'Tol' AND voorletters = 'B';

SELECT SUM(10217 / 365.25);

SELECT voorletters, tussenvoegsels, achternaam
FROM student
GROUP BY geboortedatum
HAVING FLOOR(SUM(DATEDIFF(NOW(), geboortedatum) / 365.25)) > 25;


SELECT roepnaam, tussenvoegsels, achternaam, COUNT(telefoon)
FROM student
GROUP BY telefoon;


SELECT SUM(betaald - schoolgeld)
FROM student;


SELECT roepnaam, tussenvoegsels, achternaam
FROM student
WHERE geslacht = 'm';


UPDATE student
SET telefoon = '06-1256890'
WHERE roepnaam = 'Robert' AND achternaam = 'Robertsen';


UPDATE student
SET telefoon = '06-1256890'
WHERE studentnr = '7777';

SELECT roepnaam, tussenvoegsels, achternaam
FROM student
GROUP BY telefoon;

SELECT AVG(telefoon)
FROM student;


SELECT AVG(telefoon)
FROM student;

SELECT roepnaam, tussenvoegsels, achternaam,telefoon
FROM student
GROUP BY telefoon;

SELECT roepnaam, tussenvoegsels, achternaam
FROM student
WHERE geslacht = 'm' AND NOT LIKE 'uitgeschreven';


SELECT roepnaam, tussenvoegsels, achternaam
FROM student 
WHERE COUNT(geboortedatum) < 01-01-1998 
GROUP BY geboor

select roepnaam, tussenvoegsels, achternaam
from student
where roepnaam LIKE '____'
OR roepnaam LIKE '___'
OR roepnaam LIKE '__'
OR roepnaam LIKE '_';


UPDATE student 
SET uitgeschreven = CURDATE()
WHERE studentnr = '7777';

-- Hoofdstuk 9 //

CREATE TABLE opleiding (
opleidingscode varchar(3),
	naam varchar(30),
niveau char(1),
	primary key(opleidingscode)
)
engine = InnoDB;


INSERT INTO opleiding (opleidingscode, naam, niveau)
VALUES ("IB", "ICT Beheerder", "4");


CREATE TABLE studentopleiding (
studentnr varchar(5),
opleidingscode varchar(3),
	startdatum date,
einddatum date,
diploma tinyint(1) default 0,
	CONSTRAINT FOREIGN KEY(studentnr) REFERENCES student(studentnr)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
	CONSTRAINT FOREIGN KEY(opleidingscode) REFERENCES opleiding(opleidingscode)
ON DELETE NO ACTION
ON UPDATE NO ACTION
)
engine = InnoDB;


INSERT INTO studentopleiding
VALUES("", "IB", "2015-08-01","","");



SELECT roepnaam, tussenvoegsels, achternaam
FROM student
WHERE opleiding.niveau="4";



SELECT roepnaam, tussenvoegsels, achternaam, niveau
FROM student
JOIN studentopleiding 
ON student.studentnr = studentopleiding.studentnr
JOIN opleiding
ON opleiding.opleidingscode = studentopleiding.opleidingscode;

WHERE opleiding.niveau="4";


-- Hoofdstuk 10 //

INSERT INTO studentopleiding
(studentnr, opleidingscode)
VALUES ('8888', 'EE');

SELECT COUNT(*)
FROM student
left JOIN studentopleiding 
using(studentnr)
left JOIN opleiding
using(opleidingscode)
WHERE opleiding.niveau="4";


select studentnr
FROM student
WHERE geslacht= 'v';

SELECT opleiding.naam
FROM student
left JOIN studentopleiding 
using(studentnr)
left JOIN opleiding
using(opleidingscode)
WHERE studentnr = '6666';


-- toets


INSERT INTO opleiding (opleidingscode, naam, niveau)
VALUES ("EE", " Electronic Engineering", "3");


SELECT DATE_FORMAT(CURDATE( now(), 'geboortedatum'))
FROM student
where studentnr = '5555';





SELECT DATEDIFF(NOW(), "geboortedatum")
FROM student
WHERE studentnr = '4444';


select geboortedatum
from student
where studentnr = '8888';

select DATEDIFF(NOW(), "zijn geboortedatum");

select SUM(aantal dagen / 365.25);

select FLOOR(de resultat van SUM);


SELECT DATEDIFF(NOW(), "geboortedatum")
FROM student
WHERE studentnr = '4444';
select DATEDIFF(NOW(), "zijn geboortedatum")


SELECT opleiding.naam , roepnaam
FROM student 
inner JOIN studentopleiding
USING(studentnr) 
inner JOIN opleiding 
USING(opleidingscode);


SELECT roepnaam, tussenvoegsels, achternaam
FROM student
INNER JOIN studentopleiding 
ON studentopleiding.studentnr = student.studentnr
INNER JOIN opleiding
ON opleiding.opleidingscode = studentopleiding.opleidingscode
WHERE opleiding.naam = 'ICT beheerde';

SELECT studentnr, roepnaam, tussenvoegsels, achternaam
FROM student
left JOIN studentopleiding 
using(studentnr)
left JOIN opleiding
using(opleidingscode)
WHERE opleiding.naam="ICT beheerder";


SELECT COUNT(*)
FROM student
left JOIN studentopleiding 
using(studentnr)
left JOIN opleiding
using(opleidingscode)
WHERE opleiding.naam="Applicatieontwikkeling";