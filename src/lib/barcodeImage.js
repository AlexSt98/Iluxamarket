import JsBarcode from "jsbarcode";

// Genera un PNG en alta resolución del MISMO valor y formato (CODE128)
// que ya se muestra en pantalla con <Barcode>, para que la imagen
// copiada/descargada nunca sea distinta de la que se ve en el catálogo.
// Solo cambia el tamaño de render (más grande) para que se vea nítido
// al pegarlo en Canva/Illustrator/Photoshop/Word.
export function renderBarcodePng(value, { scale = 3 } = {}) {
  return new Promise((resolve, reject) => {
    try {
      const canvas = document.createElement("canvas");
      JsBarcode(canvas, value, {
        format: "CODE128",
        width: 2 * scale,
        height: 70 * scale,
        fontSize: 20 * scale,
        margin: 16 * scale,
        background: "#ffffff",
        lineColor: "#000000",
        displayValue: true,
      });
      canvas.toBlob((blob) => {
        if (blob) resolve(blob);
        else reject(new Error("No se pudo generar la imagen."));
      }, "image/png");
    } catch (e) {
      reject(e);
    }
  });
}
