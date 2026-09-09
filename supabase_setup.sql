-- ILUXAMARKET: ejecutar DESPUÉS de tu schema.sql
-- Usa Supabase Auth. La publishable key NO reemplaza RLS.

create policy "authenticated can read products" on public.market_products for select to authenticated using (true);
create policy "authenticated can create products" on public.market_products for insert to authenticated with check (true);
create policy "authenticated can update products" on public.market_products for update to authenticated using (true) with check (true);
create policy "authenticated can delete products" on public.market_products for delete to authenticated using (true);

create policy "authenticated can read sales" on public.market_sales for select to authenticated using (true);
create policy "authenticated can create sales" on public.market_sales for insert to authenticated with check (true);
create policy "authenticated can update sales" on public.market_sales for update to authenticated using (true) with check (true);

create policy "authenticated can read sale items" on public.market_sale_items for select to authenticated using (true);
create policy "authenticated can create sale items" on public.market_sale_items for insert to authenticated with check (true);

create policy "authenticated can read inventory movements" on public.market_inventory_movements for select to authenticated using (true);
create policy "authenticated can create inventory movements" on public.market_inventory_movements for insert to authenticated with check (true);

create policy "authenticated can read cash sessions" on public.market_cash_sessions for select to authenticated using (true);
create policy "authenticated can create cash sessions" on public.market_cash_sessions for insert to authenticated with check (true);
create policy "authenticated can update cash sessions" on public.market_cash_sessions for update to authenticated using (true) with check (true);

create policy "authenticated can read conventions" on public.market_conventions for select to authenticated using (true);
create policy "authenticated can create conventions" on public.market_conventions for insert to authenticated with check (true);
create policy "authenticated can update conventions" on public.market_conventions for update to authenticated using (true) with check (true);

insert into storage.buckets (id,name,public)
values ('product-images','product-images',true)
on conflict (id) do update set public=true;

create policy "authenticated can upload product images"
on storage.objects for insert to authenticated
with check (bucket_id='product-images');

create policy "authenticated can update product images"
on storage.objects for update to authenticated
using (bucket_id='product-images')
with check (bucket_id='product-images');

create policy "authenticated can delete product images"
on storage.objects for delete to authenticated
using (bucket_id='product-images');
