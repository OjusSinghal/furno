use furno;

CREATE TABLE buyer (
    buyerID CHAR(10),
    firstName VARCHAR(30) NOT NULL,
    middleName VARCHAR(30),
    lastName VARCHAR(30),
    buyerEmailID VARCHAR(50) NOT NULL UNIQUE,
    buyerPassword VARCHAR(22) NOT NULL,
    buyerContactNumber NUMERIC(10 , 0 ) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('M', 'F', 'N', 'U'),
    -- Male, Female, Non_Binary, Unspecified
    cardNumbers JSON,
    PRIMARY KEY (buyerID),
    CHECK (buyerID LIKE 'B%'),
    CHECK (2022 - YEAR(dob) >= 15),
    CHECK (regexp_like(buyerPassword, '[a-z]')
        AND regexp_like(buyerPassword, '[!-@]')
        AND (LENGTH(buyerPassword) >= 8))
);


CREATE TABLE seller (
    sellerID CHAR(10),
    sellerName VARCHAR(30) NOT NULL,
    sellerEmailID VARCHAR(50) NOT NULL UNIQUE,
    sellerPassword VARCHAR(22) NOT NULL,
    sellerContactNumber NUMERIC(10 , 0 ) NOT NULL,
    GST NUMERIC(15 , 0 ) UNIQUE,
    PRIMARY KEY (sellerID),
    CHECK (sellerID LIKE 'S%'),
    CHECK (regexp_like(sellerPassword, '[a-z]' ) 
        AND regexp_like(sellerPassword, '[!-@]' )
        AND (LENGTH(sellerPassword) >= 8))
);
 
CREATE TABLE userAddress (
    addressID CHAR(10),
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    userState VARCHAR(50) NOT NULL,
    zip NUMERIC(6 , 0 ) NOT NULL,
    PRIMARY KEY (addressID)
);

CREATE TABLE sellerResidesIn (
    addressID CHAR(10),
    sellerID CHAR(10),
    PRIMARY KEY (sellerID , addressID),
    FOREIGN KEY (sellerID) REFERENCES seller (sellerID),
    FOREIGN KEY (addressID) REFERENCES userAddress (addressID)
);
 
CREATE TABLE buyerResidesIn (
    addressID CHAR(10),
    buyerID CHAR(10),
    PRIMARY KEY (buyerID , addressID),
    FOREIGN KEY (buyerID) REFERENCES buyer (buyerID),
    FOREIGN KEY (addressID) REFERENCES userAddress (addressID)
);

 
CREATE TABLE promoCode (
    codeName VARCHAR(15),
    minimumPrice INT NOT NULL,
    discountMultiplier NUMERIC(5 , 4 ) NOT NULL,
    expiryDate TIMESTAMP,
    activeStatus BOOLEAN NOT NULL,
    remainingRedeems INT,
    PRIMARY KEY (codeName),
    CHECK (minimumPrice >= 0),
    CHECK (remainingRedeems >= 0),
    CHECK (discountMultiplier >= 0.0
        AND discountMultiplier <= 1.0)
);

 
CREATE TABLE product (
    productID CHAR(16),
    sellerID CHAR(10) NOT NULL,
    productName VARCHAR(20) NOT NULL,
    aboutProduct VARCHAR(200) NOT NULL,
    productPrice int not null,
    category ENUM('Beds', 'Mattresses', 'Chairs', 'Tables', 'Dining', 'Sofas', 'Wardrobes', 'Other') NOT NULL,
    dimensionsHeight NUMERIC(4 , 2 ),
    dimensionsWidth NUMERIC(4 , 2 ),
    dimensionsLength NUMERIC(4 , 2 ),
    productWeight NUMERIC(6 , 2 ),
    material VARCHAR(20),
    brand VARCHAR(20),
    avgRating NUMERIC(3 , 2 ),
    discountMultiplier NUMERIC(4 , 3 ) NOT NULL,
    stock INT NOT NULL,
    images BLOB,
    PRIMARY KEY (productID),
    FOREIGN KEY (sellerID) REFERENCES seller (sellerID),
    CHECK (dimensionsHeight > 0.0
        AND dimensionsWidth > 0.0
        AND dimensionsLength > 0.0),
    CHECK (productWeight > 0.0),
    CHECK (avgRating >= 0.0 AND avgRating <= 5.0),
    CHECK (stock >= 0),
    CHECK (discountMultiplier >= 0.0
        AND discountMultiplier <= 1.0),
	check (productPrice > 0 and productPrice < 1000000)
);
 
 
 
CREATE TABLE putsIntoCart (
    buyerID CHAR(10),
    productID CHAR(10),
    quantity INT NOT NULL,
    FOREIGN KEY (buyerID) REFERENCES buyer (buyerID),
    FOREIGN KEY (productID) REFERENCES product (productID),
    PRIMARY KEY (buyerID , productID),
    CHECK (quantity > 0)
);

CREATE TABLE orders (
    orderID CHAR(16),
    totalPayment INT NOT NULL,
    orderTime TIMESTAMP NOT NULL,
    fullfillmentStatus ENUM('U', 'D', 'R', 'C') NOT NULL,
    amountDue INT NOT NULL,
    deliveryTime TIMESTAMP,
    trackingID CHAR(16) UNIQUE,
    addressID CHAR(10) NOT NULL,
    paymentMethod VARCHAR(16) NOT NULL,
    buyerID CHAR(16) NOT NULL,
    codeName VARCHAR(15),
    PRIMARY KEY (orderID),
    FOREIGN KEY (codeName)
        REFERENCES promoCode (codeName),
    FOREIGN KEY (addressID)
        REFERENCES userAddress (addressID),
    FOREIGN KEY (buyerID)
        REFERENCES buyer (buyerID),
    CHECK (deliveryTime > orderTime),
    CHECK (totalPayment > 0)
);

CREATE TABLE containsProduct (
    orderID CHAR(16),
    productID CHAR(16),
    quantity INT NOT NULL,
    fulfillmentStatus ENUM('U', 'D', 'R', 'C') NOT NULL,
    PRIMARY KEY (orderID , productID),
    FOREIGN KEY (orderID)
        REFERENCES orders (orderID),
    FOREIGN KEY (productID)
        REFERENCES product (productID),
    CHECK (quantity > 0)
);
-- #"Unfulfilled", "Delivered", "Returned", "Canceled"
 
CREATE TABLE reviews (
    buyerID CHAR(10),
    productID CHAR(16),
    reviewContent VARCHAR(500),
    rating NUMERIC(1 , 0 ) NOT NULL,
    reviewTime TIMESTAMP NOT NULL,
    PRIMARY KEY (buyerID , productID),
    FOREIGN KEY (productID)
        REFERENCES product (productID),
    FOREIGN KEY (buyerID)
        REFERENCES buyer (buyerID),
    CHECK (rating >= 0 AND rating <= 5)
);
 
show tables;
# drop table buyerResidesIn;
# drop table sellerResidesIn;
# drop table containsProduct;
# drop table putsIntoCart;
# drop table reviews;
# drop table orders;
# drop table promoCode;
# drop table buyer;
# drop table userAddress;
# drop table product;
# drop table seller;

SELECT * from seller;