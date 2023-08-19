import { decodificaUtente, requireLogin, rimuoviUtente } from "~/server/utils/auth"

export default defineEventHandler(async function(event) {
  // Blocca la richiesta se l'utente non ha effettuato il login
  const utente = decodificaUtente(event)
  requireLogin(utente)
  // Cancella il cookie contenente l'access token
  rimuoviUtente(event)
  return { message: "Logout effettuato con successo" }
})
