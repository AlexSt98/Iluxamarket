-- ILUXAMARKET: agrega soporte de código de barras a market_products
-- Ejecuta esto en Supabase → SQL Editor. Es seguro: no borra nada,
-- no toca políticas RLS existentes (ya cubren cualquier columna nueva
-- con using(true)/with check(true)), y no rompe productos existentes
-- porque la columna es opcional (NULL permitido).

alter table public.market_products
  add column if not exists barcode text;

-- Índice único PARCIAL: solo exige unicidad entre los productos que
-- ya tengan barcode asignado. Los que aún no lo tengan (NULL) no
-- generan conflicto entre sí.
create unique index if not exists market_products_barcode_key
  on public.market_products (barcode)
  where barcode is not null;
