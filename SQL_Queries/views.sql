use furno_practice;

-- Buyer profile for the buyer to see for themselves
create view buyerProfile as select firstName, middleName, lastName, buyerEmailID as EmailID, 
		buyerContactNumber as contactNumber, DOB, gender, count(orderID) as totalOrders,
        count(codeName) as numberOfPromoCodesRedeemed,
        round(avg(timestampdiff(day, orderTime, deliveryTime))) as avgDeliveryTime from 
        buyer natural join orders where deliveryTime is not null group by buyerID;

-- Seller profile for the seller to see for themselves
create view sellerProfile as select sellerName as name, sellerEmailID as emailID, 
		sellerContactNumber as contactNumber, GST, sum(quantity) as totalItemsSold,
        sum(quantity * productPrice) as totalRevenueGenerated,
        round(avg(timestampdiff(day, orderTime, deliveryTime))) as avgDeliveryTime
        from seller natural join orders natural join containsProduct natural join product 
        group by sellerID;

-- product profile for the admin to see statistics about a product
create view productView as select productName as Name, aboutProduct as about, 
		productPrice as MRP, category, avgRating as rating, 
        round(sum(quantity * productPrice * discountMultiplier)) as totalRevenueGenerated,
		sum(quantity) as totalItemsSold, count(distinct buyerID) as numberOfBuyersWhoBaughtThis
        from seller natural join orders natural join containsProduct natural join product
        group by productID;

-- what the buyer views their cart as
create view cart as select productName as name, 
		productPrice as MRP, quantity, brand, avgRating as rating,
        round(100 - 100 * discountMultiplier) as discountPercentage,
        productPrice * discountMultiplier * quantity as totalDiscountedPrice, sellerName
        from putsIntoCart natural join product natural join seller;
        

-- buyer about a product while browsing
create view productBrowsing as select productName as Name, sellerName, aboutProduct as about, 
		productPrice as MRP, category, dimensionsHeight, dimensionsLength, dimensionsWidth, 
		productWeight as weight, material, brand, avgRating as rating, 
        round(discountMultiplier * productPrice) as sellingPrice from product natural join seller;

-- buyer about their order
create view orderDetails as (select orderID, totalPayment, date(orderTime) as orderDate, 
		case when amountDue > 0 then "unpaid" else "paid" end as paymentStatus, 
        deliveryTime, trackingId, paymentMethod as paidUsing, street, city, userState, zip 
        from orders natural join buyerResidesIn);

        