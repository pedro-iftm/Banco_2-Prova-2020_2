drop procedure update_customer;
delimiter $

create procedure update_customer(cpf varchar(11), address varchar(250), zipcode varchar(10), city varchar(50), neighborhood varchar(50), state varchar(50))
begin
    declare address_id varchar(36);
    if (not validate_address(address, zipcode, city, neighborhood, state)) then
        select "Endereço incompleto" as msg;
    else
        set address_id=(select c.address_id from customer c where c.cpf = cpf);
        update address a
        set address=coalesce(address, a.address),
            zipcode=coalesce(zipcode, a.zipcode),
            city=coalesce(city, a.city),
            neighborhood=coalesce(neighborhood, a.neighborhood),
            state=coalesce(state, a.state)
        where id = address_id;
    end if;
end $

delimiter ;
