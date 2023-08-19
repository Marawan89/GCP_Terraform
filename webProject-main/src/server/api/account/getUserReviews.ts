import { createConnection } from "~~/src/server/utils/db";

export default defineEventHandler(async function (event) {

const {email} = await readBody(event)

const connection = await createConnection()
const [results] = await connection.execute(
   `SELECT * FROM recensione INNER JOIN utenti ON utenti.idUtente=recensione.idUtente WHERE(email=?)`,
   [email]
   )   
   return results
})