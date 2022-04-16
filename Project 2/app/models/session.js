const knex = require('../database/knex');

const EMPLOYEE_TABLE = 'employee'
const SESSION_TABLE = 'session';

const createSession = async (token, username)  => {
    const query = knex(SESSION_TABLE).insert({ token, username })
    console.log('Creating new session: ', query.toString());
    const result = await query;

    return result;
}

const getSession = async (token) => {
    var query = knex(SESSION_TABLE).where({ token });
    var result = await query;

    const username = result[0]['username'];

    query = knex(EMPLOYEE_TABLE).where({ username });
    result = await query;

    return result;
}

module.exports = {
    createSession,
    getSession
}