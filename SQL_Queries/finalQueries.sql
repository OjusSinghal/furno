USE furno;

--Top 10 Sellers of all time in terms of total money earned displayed in the order of their earnings(descending order)--
SELECT
  sellerID,
  SUM(productPrice * quantity) as total
FROM
  containsproduct,
  product
WHERE
  containsproduct.productID = product.productID
GROUP BY
  sellerID
ORDER BY
  total DESC
LIMIT
  10;

--Percentage of people who placed an order in the last month against total registered buyers--
SELECT
  CONCAT(
    ROUND(
      (
        COUNT(distinct orders.buyerID) / COUNT(distinct buyer.buyerID) * 100
      ),
      2
    ),
    '%'
  ) AS percentage
FROM
  orders,
  buyer
WHERE
  (MONTH(CURDATE()) - MONTH(orders.deliveryTime)) <= 1
  AND (MONTH(CURDATE()) - MONTH(orders.deliveryTime)) >= 0;


--The most expensive items in each of the category along with the name of that product and the seller--
SELECT
  DISTINCT category,
  max(productPrice) AS MaximumPrice,
  productName,
  sellerName
FROM
  product,
  seller
WHERE
  product.sellerID = seller.sellerID
GROUP BY
  category
ORDER BY
  MaximumPrice;



--Sale, 20 percent off on beds which have more than 5 pieces left in the stock.--
UPDATE
  product
SET
  discountMultiplier = 0.2
WHERE
  stock > 5
  AND category = "beds";


--Advanced search bar where you can search for a product by its name, description, brand or even category. We prioritised the name of the product over everything else and then sorted in ascending order of the category. e.g. chair
--
SELECT
  productName,
  category,
  aboutProduct,
  brand
FROM
  product
WHERE
  productName LIKE '%chair%'
  OR aboutProduct LIKE '%chair%'
  OR brand LIKE '%chair%'
  OR category LIKE '%chair%'
order by
  productName = '%chair%',
  category;



--View the total amount of the items and their quantities present in the cart after applying the discount for a particular buyer eg. B009219197--
SELECT
  (
    SUM(productPrice *(1 - discountMultiplier) * quantity)
  ) AS total
FROM
  product,
  putsIntoCart
WHERE
  putsIntoCart.productID = product.productID
  AND putsIntoCart.buyerID = 'B009219197';


--Edit the product description of the products which are out of stock--
UPDATE
  product
SET
  aboutProduct = CONCAT("OUT OF STOCK ", aboutProduct)
WHERE
  stock <= 0;

--Delete from orders which are more than 10 years old and account is status is deactive--
--update orders set orderTime = "2010-01-01 13:01:33" where buyerID like "B11%";--
--update buyer set accountActiveStatus=false where buyerID in (select buyerID from orders where orderTime = "2010-01-01 13:01:33");--
DELETE FROM
  orders
WHERE
  (YEAR(CURDATE()) - YEAR(orders.ordertime)) >= 10
  AND buyerID IN (
    SELECT
      buyerID
    FROM
      buyer
    WHERE
      accountActiveStatus = false
  );

    
--Display the status of the placed orders along with an appropriate message for a particular buyer eg, a buyer with buyerID="B016077550".--
SELECT orderID,
(CASE
	WHEN current_date()-deliveryTime > 0 THEN CONCAT("Order will be delivered soon, your tracking ID is:",trackingID)
    WHEN current_date()-deliveryTime < 0 THEN CONCAT("The order was delivered to you on ", deliveryTime)
    ELSE "The order will be delivered today"
END) AS deliveryStatus, totalPayment
FROM orders
WHERE buyerID="B016077550";


--To find the names of products a buyer has ordered from a particular seller eg. buyerID = "B016077550" and "S073588105"--
select
  distinct productName
from
  product
where
  sellerID = "S073588105"
  and productID = any (
    select
      productID
    from
      buyer,
      containsProduct,
      orders
    where
      buyer.buyerID = "B016077550"
      and buyer.buyerID = orders.buyerID
      and orders.orderID = containsProduct.orderID
  );
