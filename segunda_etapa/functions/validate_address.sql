drop function validate_address;
delimiter $

create function validate_address(address varchar(250), zipcode varchar(10), city varchar(50), neighborhood varchar(50), state varchar(50))
returns boolean
begin
    if (city is not null and (address is null or zipcode is null or neighborhood is null)) then
        return false;
    end if;
    if (zipcode is not null and (address is null)) then
        return false;
    end if;
    if (neighborhood is not null and (address is null or zipcode is null)) then
        return false;
    end if;
    if (state is not null and (address is null or zipcode is null or neighborhood is null or address is null)) then
        return false;
    end if;
    return true;
end $

delimiter ;
