import { createConnection } from "~~/src/server/utils/db";
import { Review } from "~~/src/types";

export default defineEventHandler(async function (event) {
  const dataRecensione  = new Date().toISOString().split('T')[0]
  const { votoPulizia, votoRistorazione, votoAccoglienza, idUser } = await readBody(event)
  const connection = await createConnection()
  await connection.execute(
    `INSERT INTO recensione(dataRecensione, idUtente, votoPulizia, votoRistorazione, votoAccoglienza) VALUES(?, ?, ?, ?, ?)`, [dataRecensione, idUser, votoPulizia, votoRistorazione, votoAccoglienza]
  )


  return {message: 'recensione inviata'}
})