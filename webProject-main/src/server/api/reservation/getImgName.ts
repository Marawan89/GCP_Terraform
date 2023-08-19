import { createConnection } from "~~/src/server/utils/db";

export default defineEventHandler(async function (event) {

   const {idStanza} = await readBody(event)
   const connection = await createConnection()
   const [results] = await connection.execute(
      `SELECT imgStanza FROM stanza WHERE (stanza.idStanza=?)`,
      [idStanza]
   )


   return results
})