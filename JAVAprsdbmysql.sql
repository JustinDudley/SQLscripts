

use prsdb;

create table user (    
	id int not null primary key auto_increment,   
	username varchar(30) not null unique,
    password varchar(30) not null,
    firstname varchar(30) not null,
    lastname varchar(30) not null,
    phone varchar(12),
    email varchar(255),
    isAdmin bit not null default true,
    isReviewer bit not null default true
);

use prsdb;

insert into user (username, password, firstname, lastname) 
	values ('sa', 'sa', 'System', 'Admin');
insert into user (username, password, firstname, lastname) 
	values ('jdud', 'jdudpass', 'Justin', 'Dudley');
insert into user (username, password, firstname, lastname) 
	values ('marsprig', 'marsprigpass', 'Margaret', 'Sprigg-Dudley');
insert into user (username, password, firstname, lastname) 
	values ('maxsprig', 'maxsprigpass', 'Max', 'Sprigg-Dudley');
    
select * from user

