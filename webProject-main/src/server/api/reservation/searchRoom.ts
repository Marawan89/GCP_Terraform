import { createConnection } from "~/server/utils/db";

export default defineEventHandler(async function (event) {
    const { tagliaStanza, dataInizio, dataFine, controlloUtente } = await readBody(event)

    const connection = await createConnection()


    switch (controlloUtente) {
        case false: //prendo tutte le stanze NON prenotate, sono gestore
           const [results1] = await connection.execute(
              `SELECT stanza.* 
              FROM stanza
              LEFT JOIN prenotazione
              ON stanza.idStanza = prenotazione.idStanza
              ORDER BY tagliaStanza`,
           )
           return results1
        case true: //mi prendo le stanze NON prenotate filtrate per periodo e tipologiaStanza, sono utente
           const [results2] = await connection.execute(
            `SELECT stanza.* 
            FROM stanza
            LEFT JOIN prenotazione
            ON stanza.idStanza = prenotazione.idStanza
            AND prenotazione.dataInizioPrenotazione <= ? 
            AND prenotazione.dataFinePrenotazione >= ?
            WHERE prenotazione.idPrenotazione IS NULL AND stanza.tagliaStanza = ?;  
            `,
            [dataFine, dataInizio, tagliaStanza]
           )
           return results2
     }

})