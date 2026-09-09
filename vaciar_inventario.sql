-- ILUXAMARKET: vaciar TODOS los datos de prueba (productos, ventas, movimientos, caja, convenciones)
-- Ejecuta esto en Supabase → SQL Editor. Es IRREVERSIBLE: no hay forma de deshacerlo después.
-- El esquema (tablas, columnas, políticas RLS) NO se toca, solo se borran los datos.

truncate table
  public.market_sale_items,
  public.market_sales,
  public.market_inventory_movements,
  public.market_products,
  public.market_cash_sessions,
  public.market_conventions
restart identity cascade;

-- Borra también las imágenes de prueba subidas al bucket de productos
delete from storage.objects where bucket_id = 'product-images';
