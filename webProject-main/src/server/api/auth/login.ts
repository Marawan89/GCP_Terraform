import bcrypt from "bcrypt"
import { codificaUtente, decodificaUtente, requireLogout } from "~/server/utils/auth"
import { createConnection } from "~/server/utils/db"

export default defineEventHandler(async function(event) {
  // l'utente non può loggare due volte
  const utente = decodificaUtente(event)

  requireLogout(utente)

  // estraiamo username e password dal body
  const { email, password } = await readBody(event)


  //i dati dell'utente sono presi dal database in base allo email
  const connection = await createConnection()
  const [results] = await connection.execute(
    `SELECT *
    FROM utenti
    WHERE email=?`,
    [email]
  )
  
  /*perche left outer join? perche altrimenti con i join impliciti se un utente non ha la categoria allora non lo troviamo*/
  
  if (!Array.isArray(results) || results.length == 0) {
    throw createError({ statusCode: 400, statusMessage: "Credenziali errate"})/*messaggio di errore sempre uguale perche non vogliamo far sapere a un mal intenzionato che ha azzeccatto solo lo username rispetto a solo la password */
  }
  
  const user = results[0] as any
  
  // Confronta l'hash della password fornita con quello nel database
  const passwordCorretta = await bcrypt.compare(password, user.password)
  
  if (!passwordCorretta) {
    throw createError({ statusCode: 400, statusMessage: "Credenziali errate"})
  }
  
  /*messaggio di errore sempre uguale perche non vogliamo far sapere a un mal intenzionato che ha azzeccatto solo lo username rispetto a solo la password */
  
  // Rimuove la password dall'oggetto utente in modo che rimanga nel server
  delete user.password
  
  // Crea un JWT contenente i dati dell'utente e lo imposta come cookie
  codificaUtente(event, user) 
  
  return { message: "Login effettuato con successo" }
})
