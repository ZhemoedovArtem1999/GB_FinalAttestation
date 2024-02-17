-- В подключенном MySQL репозитории создать базу данных “Друзья человека”
create database HumanFriends;

use HumanFriends;


-- Создать таблицы с иерархией из диаграммы в БД
create table Animal(id int primary key auto_increment, 
					name nvarchar(50),
                    dateOfBirth date,
                    commands text);
                    
create table HomeAnimal(id int primary key auto_increment, 
					name nvarchar(50),
                    dateOfBirth date,
                    commands text);
                    
                    
create table PackAnimal(id int primary key auto_increment, 
					name nvarchar(50),
                    dateOfBirth date,
                    commands text);
    
    
create table Dog(id int primary key auto_increment, 
					name nvarchar(50),
                    dateOfBirth date,
                    commands text);
                    
                    
create table Cat(id int primary key auto_increment, 
					name nvarchar(50),
                    dateOfBirth date,
                    commands text);

create table Hamster(id int primary key auto_increment, 
					name nvarchar(50),
                    dateOfBirth date,
                    commands text);
                    
                    
create table Horse(id int primary key auto_increment, 
					name nvarchar(50),
                    dateOfBirth date,
                    commands text);

create table Camel(id int primary key auto_increment, 
					name nvarchar(50),
                    dateOfBirth date,
                    commands text);
                    
                    
create table Donkey(id int primary key auto_increment, 
					name nvarchar(50),
                    dateOfBirth date,
                    commands text);
                    
-- Заполнить низкоуровневые таблицы именами(животных), командами которые они выполняют и датами рождения                    
insert into Dog(name, dateOfBirth, commands) VALUES
('Dog1', date('2022/08/02'), 'comands'),
('Dog2', date('2022/07/02'), 'comands'),
('Dog3', date('2022/06/02'), 'comands');

insert into Cat(name, dateOfBirth, commands) VALUES
('Cat1', date('2022/08/02'), 'comands'),
('Cat2', date('2022/07/02'), 'comands'),
('Cat3', date('2022/06/02'), 'comands');

insert into Hamster(name, dateOfBirth, commands) VALUES
('Hamster1', date('2022/08/02'), 'comands'),
('Hamster2', date('2022/07/02'), 'comands'),
('Hamster3', date('2022/06/02'), 'comands');

insert into Donkey(name, dateOfBirth, commands) VALUES
('Donkey1', date('2022/08/02'), 'comands'),
('Donkey2', date('2022/07/02'), 'comands'),
('Donkey3', date('2022/06/02'), 'comands');

insert into Camel(name, dateOfBirth, commands) VALUES
('Camel1', date('2022/08/02'), 'comands'),
('Camel2', date('2022/07/02'), 'comands'),
('Camel3', date('2022/06/02'), 'comands');

insert into Horse(name, dateOfBirth, commands) VALUES
('Horse1', date('2022/08/02'), 'comands'),
('Horse2', date('2012/07/02'), 'comands'),
('Horse3', date('2022/06/02'), 'comands');

insert into Horse(name, dateOfBirth, commands) VALUES
('Horse4', date('2012/07/02'), 'comands');

-- Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.
truncate table Camel;

-- Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью до месяца подсчитать возраст животных в новой таблице
create table youngAnimal AS 
select name, dateOfBirth, commands,  CONCAT(TIMESTAMPDIFF(YEAR, dateOfBirth, current_date), ' years ', 
              TIMESTAMPDIFF(MONTH, dateOfBirth, current_date) % 12, ' months') AS Age
FROM Dog
WHERE dateOfBirth <= DATE_SUB(current_date, INTERVAL 1 YEAR) AND 
      dateOfBirth >= DATE_SUB(current_date, INTERVAL 3 YEAR)
UNION
select name, dateOfBirth, commands,  CONCAT(TIMESTAMPDIFF(YEAR, dateOfBirth, current_date), ' years ', 
              TIMESTAMPDIFF(MONTH, dateOfBirth, current_date) % 12, ' months') AS Age
FROM Cat
WHERE dateOfBirth <= DATE_SUB(current_date, INTERVAL 1 YEAR) AND 
      dateOfBirth >= DATE_SUB(current_date, INTERVAL 3 YEAR)
UNION
select name, dateOfBirth, commands,  CONCAT(TIMESTAMPDIFF(YEAR, dateOfBirth, current_date), ' years ', 
              TIMESTAMPDIFF(MONTH, dateOfBirth, current_date) % 12, ' months') AS Age
FROM Hamster
WHERE dateOfBirth <= DATE_SUB(current_date, INTERVAL 1 YEAR) AND 
      dateOfBirth >= DATE_SUB(current_date, INTERVAL 3 YEAR)
UNION
select name, dateOfBirth, commands,  CONCAT(TIMESTAMPDIFF(YEAR, dateOfBirth, current_date), ' years ', 
              TIMESTAMPDIFF(MONTH, dateOfBirth, current_date) % 12, ' months') AS Age
FROM Horse
WHERE dateOfBirth <= DATE_SUB(current_date, INTERVAL 1 YEAR) AND 
      dateOfBirth >= DATE_SUB(current_date, INTERVAL 3 YEAR)
UNION
select name, dateOfBirth, commands,  CONCAT(TIMESTAMPDIFF(YEAR, dateOfBirth, current_date), ' years ', 
              TIMESTAMPDIFF(MONTH, dateOfBirth, current_date) % 12, ' months') AS Age
FROM Camel
WHERE dateOfBirth <= DATE_SUB(current_date, INTERVAL 1 YEAR) AND 
      dateOfBirth >= DATE_SUB(current_date, INTERVAL 3 YEAR)
UNION
select name, dateOfBirth, commands,  CONCAT(TIMESTAMPDIFF(YEAR, dateOfBirth, current_date), ' years ', 
              TIMESTAMPDIFF(MONTH, dateOfBirth, current_date) % 12, ' months') AS Age
FROM Donkey
WHERE dateOfBirth <= DATE_SUB(current_date, INTERVAL 1 YEAR) AND 
      dateOfBirth >= DATE_SUB(current_date, INTERVAL 3 YEAR);
      
-- Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.
create table UnionAnimal AS 
select name, dateOfBirth, commands, 'Dog' AS oldTable
FROM Dog
UNION
select name, dateOfBirth, commands, 'Cat' AS oldTable
FROM Cat
UNION
select name, dateOfBirth, commands, 'Hamster' AS oldTable
FROM Hamster
UNION
select name, dateOfBirth, commands, 'Horse' AS oldTable
FROM Horse
UNION
select name, dateOfBirth, commands, 'Donkey' AS oldTable
FROM Camel
UNION
select name, dateOfBirth, commands, 'Donkey' AS oldTable
FROM Donkey;



