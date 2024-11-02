/*
Calcular el importe de cada platillo en una orden
*/
DELIMITER $$
create trigger calcularImporte
before insert on ord_dish
for each row
begin
declare precioProd float,
declare msg VARCHAR(30)
    set precioProd=(select price
                from dish 
                where code = new.dish)
    set new.amount = precioProd = new.numberDishes
end if$$
