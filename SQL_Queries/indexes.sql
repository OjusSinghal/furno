--buyerResidesIn--
ALTER TABLE `buyerresidesin` ADD INDEX `buyerresidesin_idx_city` (`city`);

--product--
ALTER TABLE `product` ADD INDEX `product_idx_category_stock` (`category`,`stock`);

--buyer-
ALTER TABLE `buyer` ADD INDEX `buyer_idx_accountactivestatus` (`accountActiveStatus`);

--orders--
ALTER TABLE `orders` ADD INDEX `orders_idx_buyerid_orderid` (`buyerID`);

--buyer--
ALTER TABLE `buyer` ADD INDEX `buyer_idx_buyerid_orderid` (`buyerID`);

--orders--
ALTER TABLE `containsProduct` ADD INDEX `containsProduct_idx_buyerid_orderid` (`orderID`);
