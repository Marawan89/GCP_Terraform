import { decodificaUtente } from "~/server/utils/auth"

export default defineEventHandler(async function(event) {
  // Decodifica il contenuto dell'access token, che contiene il dati dell'utente, e lo invia in risposta
  const utente = decodificaUtente(event)
  return utente
})
