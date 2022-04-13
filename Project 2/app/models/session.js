const knex = require('../database/knex');

const SESSION_TABLE = 'session';

const createSession = async (token, username, password)  => {
    try {
        const query = knex(SESSION_TABLE).insert({ token, username, password })
        console.log('Creating new session: ', query.toString());
        const result = await query;

        return result;
    } catch (err) {
        console.error("Error creating session query", err);
        res.status(500).json({ message: err.toString() });
    }
}

module.exports = {
    createSession
}