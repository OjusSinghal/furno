use furnoDB;

create table buyer (
	buyerID char(10) primary key,
	firstName varchar(50) not null,
	secondName varchar(50),
	lastName varchar(50),
	dob date not null,
	gender enum("M", "F", "T", "O", "U"), 
	contactNumber numeric(10,0) not null,
	email varchar(200) not null,
	buyerPassword varchar(50) not null,
	cardNumbers json,
	check (buyerID like "B%"),
    check (2022 - year(dob) >= 18)
);

SELECT * from buyer;
