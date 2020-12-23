drop trigger calculate_rent_price;
delimiter $

create trigger calculate_rent_price
before update
on rent for each row
begin
    declare suggested_value decimal(10, 2);
    declare rented_days int;
    if (new.rented is not null) then
        set suggested_value=(select m.suggested_value from movie m where m.id = new.movie_id);
        set rented_days=(select datediff(new.returned, new.rented));
        set new.value = suggested_value * rented_days;
    end if;

end $

delimiter ;

/* run add_rent and after */
/* update rent set returned = now() + interval 5 day where id = 71; */
/* select * from rent; */
