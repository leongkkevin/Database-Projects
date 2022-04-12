const mysql = require('mysql');
const util = require('util');

const connectToDatabase = async () => {
    try {
        const DBConnection = mysql.createConnection({
            host: 'localhost',
            port: 3306,
            user: 'root',
            password: '',
            insecureAuth: true,
            database: 'parking_db'
        });

        const DBCreateConnection = util.promisify(DBConnection.connect).bind(DBConnection);
        await DBCreateConnection();

        const DBquery = util.promisify(DBConnection.query).bind(DBConnection);
        const disconnect = () => DBConnection.end();
        return { DBquery, disconnect };

    } catch (err) {
        console.error('There was an error with the DB', err);
        throw err;
    }
};

module.exports = connectToDatabase;