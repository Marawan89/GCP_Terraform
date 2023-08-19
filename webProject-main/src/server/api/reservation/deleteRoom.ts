import { createConnection } from "../../utils/db";

export default defineEventHandler(async function(event) {
  const {idStanza} = await readBody(event)

  const connection = await createConnection()
  
  await connection.execute(
    `DELETE FROM stanza WHERE stanza.idStanza = ?`,
    [idStanza]
  )

  return { message: "stanza eliminata con successo" }
})