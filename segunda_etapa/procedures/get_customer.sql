drop procedure get_customer;
delimiter $

create procedure get_customer(cpf varchar(11))
begin
    declare formated_cpf varchar(14);
    declare gender varchar(8);
    set formated_cpf=(select cpf_mask(cpf));
    set gender=(
        select case when c.gender = 'M' then 'Masculino'
        else 'Feminino' end
        from customer c where c.cpf = cpf
    );
    select
        formated_cpf,
        c.name,
        c.telephone,
        gender,
        c.birth_date,
        a.address,
        a.zipcode,
        a.city,
        a.neighborhood,
        a.state
    from customer c
    inner join address a
        on a.id = c.address_id
    where c.cpf = cpf;
end $

delimiter ;

/* call get_customer('97438685646'); */
