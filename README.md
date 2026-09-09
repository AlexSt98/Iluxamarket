# IluxaMarket - Supabase Ready

Aplicación independiente de ventas e inventario.

## Incluye
- Supabase Auth
- Productos y SKU desde `market_products`
- Subida de imágenes a Supabase Storage desde Catálogo / SKU
- Imagen asociada automáticamente al producto
- Venta, ticket, stock y movimientos
- Cambio recomendado con denominaciones MXN
- Historial, dashboard, caja y escáner preparado

## Local
1. `npm install`
2. Copia `.env.example` a `.env.local`
3. Pon tu `VITE_SUPABASE_PUBLISHABLE_KEY`
4. `npm run dev`

## Supabase
Ejecuta `supabase_setup.sql` en SQL Editor después del schema de tablas que ya creaste.

La app usa la publishable key en el cliente y RLS para limitar el acceso. Nunca uses una secret/service key en el frontend.
