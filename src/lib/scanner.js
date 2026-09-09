import { BrowserMultiFormatReader } from "@zxing/browser";

// true si el navegador/dispositivo puede pedir cámara (requiere contexto seguro HTTPS)
export const isCameraSupported = () =>
  typeof navigator !== "undefined" &&
  !!navigator.mediaDevices &&
  !!navigator.mediaDevices.getUserMedia;

// Inicia la cámara trasera y decodifica códigos de barras en continuo sobre el <video>.
// onDecode(text) se llama cada vez que se detecta un código.
// Devuelve un objeto con .stop() para apagar la cámara.
export async function startCamera(videoEl, onDecode) {
  const reader = new BrowserMultiFormatReader();
  return reader.decodeFromConstraints(
    { video: { facingMode: { ideal: "environment" } } },
    videoEl,
    (result) => {
      if (result) onDecode(result.getText());
    }
  );
}
