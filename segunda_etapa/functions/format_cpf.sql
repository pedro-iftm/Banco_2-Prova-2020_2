drop function cpf_mask;

delimiter $

create function cpf_mask(cpf varchar(18))
returns varchar(18)
begin
    return concat(
      substring(cpf, 1, 3),
      '.',
      substring(cpf, 3, 3),
      '.',
      substring(cpf, 6, 3),
      '-',
      substring(cpf, 10, 2)
    );
end $

delimiter ;
