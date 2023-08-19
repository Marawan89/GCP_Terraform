import { createConnection } from "../../utils/db";

export default defineEventHandler(async function(event) {
  const {prezzoAnotte, tagliaStanza, tipologiaStanza } = await readBody(event)

  const connection = await createConnection()
  
  await connection.execute(
    `INSERT INTO stanza (prezzoAnotte, tagliaStanza, tipologiaStanza) VALUES (?, ?, ?)`,
    [prezzoAnotte, tagliaStanza, tipologiaStanza]
  )

  return { message: "stanza aggiunta con successo" }
});