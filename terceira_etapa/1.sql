/* $ sudo mysql */

/*
a
*/
CREATE USER 'pedro'@'localhost' IDENTIFIED BY '0caaRa';

/*
b
*/
GRANT ALL PRIVILEGES ON video_store.* TO 'pedro'@'localhost';

/*
c
*/
GRANT GRANT OPTION ON video_store.* TO 'pedro'@'localhost';

/*
d
Vide on 1d.png
*/

/*
e
*/
CREATE USER 'estagiario'@'localhost' IDENTIFIED BY '0car1nhah';

/*
f
*/
GRANT SELECT ON video_store.* TO 'estagiario'@'localhost';

/*
g
*/
REVOKE GRANT OPTION ON video_store.* from 'pedro'@'localhost';

/*
h
Vide on 1d.png
*/

/*
i
*/
CREATE INDEX idx_customer_birth_date ON customer(birth_date);

/*
j
*/
REVOKE SELECT ON video_store.* from 'estagiario'@'localhost';
