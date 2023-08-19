import { createConnection } from "~/server/utils/db";

export default defineEventHandler(async function (event) {

    const { id } = await readBody(event)

    // le stanze sono prese dal database in base all'id della stanza (che riceve in input)  
    
    const connection = await createConnection()
    const [results] = await connection.execute(
        `SELECT * FROM stanza WHERE stanza.idStanza=?`,
        [id]
    )




    return results

})