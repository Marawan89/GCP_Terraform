import { createConnection } from "../../utils/db";

export default defineEventHandler(async function(event) {
  const {idPrenotazione} = await readBody(event)

  const connection = await createConnection()
  
  await connection.execute(
    `DELETE FROM prenotazione WHERE prenotazione.idPrenotazione = ?`,
    [idPrenotazione]
  )

  return { message: "prenotazione eliminata con successo" }
});