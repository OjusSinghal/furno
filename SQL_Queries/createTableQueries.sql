use furnodb;

create table buyer (
    buyerID char(10) primary key,
    firstName varchar(50) not null,
    secondName varchar(50),
    lastName varchar(50),
    dob date not null,
    gender enum("M", "F", "T", "O", "U"),
    # "Male", "Female", "Transgender", "Other", "Unspecified" 
    contactNumber numeric(10,0) not null,
    email varchar(200) not null UNIQUE,
    buyerPassword varchar(50) not null,
    cardNumbers json,
    check (buyerID like "B%"),
    check (2022 - year(dob) >= 15)
);
 
 
create table seller (
    sellerID char(10) PRIMARY KEY,
    userPassword VARCHAR(50) NOT NULL,
    userContactNumber NUMERIC(10,0) NOT NULL,
    userEmailID VARCHAR(200) NOT NULL UNIQUE,
    sellerName VARCHAR(200) NOT NULL,
    GST NUMERIC(15,0) UNIQUE,
    check (sellerID like "S%")
);
 
create TABLE userAddress (
    addressID CHAR(10) PRIMARY KEY,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    userState VARCHAR(100) NOT NULL,
    zip CHAR(6) NOT NULL
);
 
create TABLE sellerResidesIn (
    addressID CHAR(10),
    sellerID CHAR(10),
    PRIMARY KEY (sellerID, addressID),
    FOREIGN KEY (sellerID) REFERENCES seller(sellerID),
    FOREIGN KEY (addressID) REFERENCES userAddress(addressID)
);
 
create TABLE buyerResidesIn (
    addressID CHAR(10),
    buyerID CHAR(10),
    PRIMARY KEY (buyerID, addressID),
    FOREIGN KEY (buyerID) REFERENCES buyer(buyerID),
    FOREIGN KEY (addressID) REFERENCES userAddress(addressID)
);

 
create table promoCode (
   codeName varchar(15) primary key,
   minimumPrice int not null,
   discountMultiplier numeric(5, 4) not null,
   expiryDate timestamp,
   activeStatus boolean not null,
   remainingRedeems int,
   check (minimumPrice >= 0),
   check (remainingRedeems >= 0)
);

 
create table product(
  productID char(16) primary key,
  productName varchar(20) not null,
  aboutProduct varchar(100) not null,
  category enum ("Beds", "Mattresses", "Chairs", "Tables", "Dining", "Sofas", "Wardrobes"),
  dimensionsHeight numeric(4, 2),
  dimensionsWidth numeric(4, 2),
  dimensionsLength numeric(4, 2),
  productWeight numeric(4, 2),
  material varchar(20),
  brand varchar(20),
  avgRating numeric(3, 2),
  discountMultiplier numeric(4, 3) not null,
  stock int not null,
  sellerID char(10) not null,
  images blob,
  foreign key (sellerID) references seller(sellerID),
  check (dimensionsHeight > 0.0),
  check (dimensionsWidth > 0.0),
  check (dimensionsLength > 0.0),
  check (productWeight > 0.0),
  check (avgRating >= 0.0 and avgRating <= 5.0)  
);
 
 
 
create TABLE selects (
    buyerID CHAR(10),
    productID CHAR(10),
    quantity INT NOT NULL,
    FOREIGN KEY (buyerID) REFERENCES buyer(buyerID),
    FOREIGN KEY (productID) REFERENCES product(productID),
    PRIMARY KEY(buyerID, productID)
);
 
create TABLE lists (
    sellerID CHAR(10),
    productID CHAR(10),
    stock INT NOT NULL,
    discountMultiplier INT,
    FOREIGN KEY (sellerID) REFERENCES seller(sellerID),
    FOREIGN KEY (productID) REFERENCES product(productID),
    PRIMARY KEY(sellerID, productID),
    check (stock >= 1)
);

create table orders(
   orderID char(16) primary key,
   totalPayment int not null,
   orderTime timestamp not null,
   fullfillmentStatus enum("U", "D", "R", "C") not null,
   #"Unfulfilled", "Delivered", "Returned", "Canceled"
   amountDue int not null,
   deliveryTime timestamp,
   trackingID char(16) unique,
   # trackingID is different from orderID because it might change for the same order
   addressID char(10) not null,
   paymentMethod varchar(16) not null,
   # this is 0 when cash, 16 digit card number when card
   buyerID char(16) not null,
   codeName varchar(15),
   check (deliveryTime > orderTime),
   foreign key (codeName) references promoCode(codeName),
   foreign key (addressID) references userAddress(addressID),
   foreign key (buyerID) references buyer(buyerID)
);

create table containsProduct (
   orderID char(16),
   productID char(16),
   quantity int not null,
   fulfillmentStatus enum("U", "D", "R", "C") not null,
   -- #"Unfulfilled", "Delivered", "Returned", "Canceled"
   primary key (orderID, productID),
   foreign key (orderID) references orders(orderID),
   foreign key (productID) references product(productID),
   check (quantity > 0)
);

 
create table reviews(
   reviewID char(16) primary key,
   reviewContent varchar(500),
   rating numeric(1, 0) not null,
   reviewTime timestamp not null,
   productID char(16),
   foreign key (productID) references product(productID),
   check (rating >= 0 and rating <= 5)
);
 
 
show tables;
select * from seller;