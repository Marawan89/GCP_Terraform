import { createConnection } from "../../utils/db";
import { decodificaUtente } from "../../utils/auth";

export default defineEventHandler(async function(event) {
  const user = decodificaUtente(event)
  const { dataInizio, dataFine, idUtente, idStanza } = await readBody(event)

  const connection = await createConnection()
  
  // Inserisce la prenotazione nel database
  await connection.execute(
    `INSERT INTO prenotazione ( dataInizioPrenotazione, dataFinePrenotazione, idUtente, idStanza) VALUES (?, ?, ?, ?)`,
    [dataInizio, dataFine, user?.idUtente, idStanza]
  )

  return { message: "Prenotazione effettuata con successo" }
});