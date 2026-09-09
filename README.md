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

### Escáner con código de barras
Ejecuta `sql/01_add_barcode_column.sql` en el SQL Editor para agregar la columna opcional
`barcode` a `market_products`. El escáner (página **Escáner**) busca primero por `barcode`
y si no hay coincidencia, por `sku` — así sigue funcionando aunque un producto todavía no
tenga código de barras asignado. Requiere HTTPS (ya cubierto en Vercel) y permiso de cámara
del navegador.

### Limpiar productos de prueba
`sql/02_check_test_skus.sql` es un diagnóstico de solo lectura para ver si los SKUs de
prueba tienen ventas o movimientos asociados antes de borrarlos.
