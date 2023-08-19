import { H3Event } from "h3"
import jwt from "jsonwebtoken"
import { Utente } from "~/types"

const JWT_SECRET = "jfiowfwfwffjrf3rf3rfg" /*deve essere una stringa lunga e incomprensibile*/
const COOKIE_NAME = "access-token"

export function codificaUtente(event: H3Event, user: any) {
  const accessToken = jwt.sign(user, JWT_SECRET, { expiresIn: "1 day" })   /*ogni giorno gli utenti devono fare il login */
  //settiamo il cookie
  setCookie(event, COOKIE_NAME, accessToken, {
    httpOnly: true,
    sameSite: true,
    secure: true
  })
}

export function decodificaUtente(event: H3Event) {
  // Ottiene il cookie dell'access token
  const accessToken = getCookie(event, COOKIE_NAME)
  // Restituisce i dati dell'utente contenuti nell'access token, oppure null se il token è mancante o invalido
  if (!accessToken) return null
  try {
    const user = jwt.verify(accessToken, JWT_SECRET) as Utente
    return user
  } catch {
    return null
  }
}

export function rimuoviUtente(event: H3Event) {
  // Cancella il cookie dell'access token
  deleteCookie(event, COOKIE_NAME) 
}

/** Blocca la richiesta se l'utente non ha effettuato il login */
export function requireLogin(utente: Utente | null) {
  if (utente == null) {
    throw createError({ statusCode: 403, statusMessage: "Questa azione richiede il login" })
  }
}

/** Blocca la richiesta se l'utente ha effettuato il login */
export function requireLogout(utente: Utente | null) {
  if (utente != null) {
    throw createError({ statusCode: 403, statusMessage: "Questa azione richiede il logout" })
  }
}
