
use electrautp;
SELECT * FROM FAC_CABE;
USE electrautp;
CREATE PROCEDURE SPMES(AN INT)
SELECT MONTH(Fecha) MES, COUNT(*) CAN_producto, SUM(pre_producto*can_producto) TOTAL
FROM FAC_CABE F, FAC_DETA D, electrodomesticos e
WHERE F.id_factura=D.id_factura AND D.id_producto=e.id_producto AND YEAR(fecha)=AN
GROUP BY MONTH(fecha);
