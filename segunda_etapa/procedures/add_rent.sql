drop procedure add_rent;
delimiter $

create procedure add_rent(cpf varchar(11), movie_id varchar(36), rented date)
begin
    if (select not exists(select * from customer c where c.cpf = cpf)) then
        select 'CPF não existe na base' as message;
    end if;

    if (select not exists(select * from movie m where m.id = movie_id)) then
        select 'Filme não existe na base' as message;
    end if;

    set @post = 'insert into rent (customer_id, movie_id, rented) values (?, ?, ?)';
    prepare statement from @post;
    set @rented = coalesce(rented, now());
    set @cpf = cpf;
    set @movie_id = movie_id;
    execute statement using @cpf, @movie_id, @rented;

end $

delimiter ;

/* call add_rent('56138511867', '137d130c-d37d-413d-9d90-701a992f89a1', null); */
/* select * from rent; */
