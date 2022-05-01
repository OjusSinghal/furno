CREATE TRIGGER reviews_ai AFTER INSERT ON reviews
FOR EACH ROW
	UPDATE product SET avgRating = (select AVG(rating) FROM reviews WHERE productID = NEW.productID);