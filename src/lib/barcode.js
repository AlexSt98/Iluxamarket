import { supabase } from "./supabase";

// Pide a Supabase el siguiente código de barras interno único
// (secuencia atómica en la base de datos, nunca se repite ni se reutiliza).
export async function nextBarcode() {
  const { data, error } = await supabase.rpc("generate_next_barcode");
  if (error) throw error;
  return data;
}
