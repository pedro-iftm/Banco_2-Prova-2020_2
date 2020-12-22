/* drop table rent_by_gender; */
drop trigger rent_by_gender;

create table rent_by_gender(
    id int not null auto_increment,
    gender varchar(50) not null,
    counter int not null,
    primary_key(id)
)

delimiter $

create trigger rent_by_gender
after insert
on rent for each row
begin
    declare gender varchar(50);
    declare counter int;
    set gender=(select m.gender from movie m where m.id = new.movie_id);
    set counter=(select rg.counter + 1 from rent_by_gender where rg.gender = gender);
    update rent_by_gender rg set rg.counter = counter where rg.gender = gender;
    /* TODO: Test */
end $

delimiter ;
