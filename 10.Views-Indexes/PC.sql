/*12*/
CREATE INDEX index_product
ON product(maker, model, type);

/*14*/
DROP INDEX product.index_product;