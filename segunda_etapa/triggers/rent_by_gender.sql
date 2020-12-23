/* drop table rent_by_gender; */
drop trigger set_rent_by_gender;

create table rent_by_gender(
    id int not null auto_increment,
    gender varchar(50) not null,
    counter int not null,
    primary key(id)
);

delimiter $

create trigger set_rent_by_gender
after insert
on rent for each row
begin
    declare gender varchar(50);
    declare counter decimal(9, 2);
    set gender=(select m.gender from movie m where m.id = new.movie_id);
    set counter=(select rg.counter + 1 from rent_by_gender rg where rg.gender = gender);
    if (counter is null) then
        insert into rent_by_gender (gender, counter) values (gender, 1);
    else
        update rent_by_gender rg set rg.counter = counter where rg.gender = gender;
    end if;
end $

delimiter ;

/* DELETE FROM rent where id = '1'; */
/* INSERT INTO rent values ('1', '1dcdbd2f-c56c-4b32-abb5-ca8f82c4d34b', '63ffaf2a-ff01-49c1-ad00-71eb40d40eca', '2018-02-08', '2019-02-09', 19.84); */
/* select * from rent_by_gender; */
