-- ILUXAMARKET: generador de códigos de barras internos únicos
-- Ejecuta esto en Supabase → SQL Editor, DESPUÉS de sql/01_add_barcode_column.sql
-- No borra ni modifica nada existente. No toca RLS, Auth, ni ninguna tabla.

-- Secuencia: solo avanza hacia adelante, nunca repite un valor,
-- incluso si borras productos después (a diferencia de contar filas existentes).
create sequence if not exists public.market_barcode_seq start 1 increment 1;

-- Entrega el siguiente código formateado: "2" + 11 dígitos con ceros a la izquierda.
-- Ej: seq=1 -> 200000000001, seq=2 -> 200000000002, etc.
create or replace function public.generate_next_barcode()
returns text
language sql
security definer
set search_path = public
as $$
  select '2' || lpad(nextval('public.market_barcode_seq')::text, 11, '0');
$$;

-- Permite que la app (usuario autenticado) la invoque vía supabase.rpc(...).
grant execute on function public.generate_next_barcode() to authenticated;
