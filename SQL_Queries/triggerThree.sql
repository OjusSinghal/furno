
delimiter ##
CREATE TRIGGER cart_bi BEFORE INSERT ON putsIntoCart
FOR EACH ROW
BEGIN
update putsIntoCart
set quantity = (case
	when NEW.productID IN (SELECT productID FROM putsIntoCart WHERE buyerID = NEW.buyerID) THEN 
		quantity = quantity+ NEW.quantity 
	ELSE 
		quantity = NEW.quantity
	END )
where productID = NEW.productID AND buyerID = NEW.buyerID;
END ##
delimiter ;
