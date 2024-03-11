/*Calcula el nombre de línies de tiquet que hagin venut els empleats on el seu nom comença per O abans del dia d’avui. 
*/
use MER7;
select count(*)
from Linia_Ticket, TICKET, EMPLEAT
WHERE TICKET.ID = Linia_Ticket.Ticket_ID AND
EMPLEAT.ID=TICKET.EMPLEAT_ID AND
EMPLEAT.Nom LIKE "0%";
