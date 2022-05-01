DELIMITER $$
CREATE TRIGGER orders_ai AFTER INSERT ON orders
FOR EACH ROW 
BEGIN
UPDATE promoCode SET remainingRedeems = remainingRedeems -1 WHERE promoCode.codeName = codeName AND remainingRedeems >= 1;
UPDATE promoCode SET activeStatus = 0 WHERE remainingRedeems = 0 OR CURDATE() > expiryDate;
END$$
DELIMITER ;
