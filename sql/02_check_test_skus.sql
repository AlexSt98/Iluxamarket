-- ILUXAMARKET: diagnóstico de los SKUs de prueba (SOLO LECTURA, no borra nada)
-- Ejecuta esto en Supabase → SQL Editor y pásame el resultado.
-- Con eso te armo el DELETE final exacto y seguro (paso 03).

select
  p.id,
  p.sku,
  p.name,
  p.stock,
  (select count(*) from public.market_sale_items si where si.product_id = p.id) as sale_items,
  (select count(*) from public.market_inventory_movements m where m.product_id = p.id) as movements,
  (
    select array_agg(distinct s.ticket_number)
    from public.market_sale_items si
    join public.market_sales s on s.id = si.sale_id
    where si.product_id = p.id
  ) as tickets_afectados
from public.market_products p
where p.sku in (
  'MICH-MP-001',
  'MICH-PIN-001',
  'ILX-ART-001',
  'MICH-BBX-001',
  'MICH-KEY-001',
  'ILX-STK-001'
);
