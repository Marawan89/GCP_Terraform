import { createConnection } from "../../utils/db";

export default defineEventHandler(async function(event) {
  const {rispostaRecensione, idRecensione} = await readBody(event)
  const connection = await createConnection()
  
  //aggiorno la tabella recensione con la recensione scritta dal gestore
  await connection.execute(
    `UPDATE recensione SET rispostaRecensione = ? WHERE recensione.idRecensione = ?`,
    [rispostaRecensione, idRecensione]
  )

  return { message: "risposta aggiunta con successo" }
});