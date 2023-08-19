import mysql from "mysql2/promise"

export function createConnection(){
    return mysql.createConnection({      
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'astra'
    })
}

