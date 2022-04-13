const knex = require('../database/knex');
const bcrypt = require('bcrypt');

const USER_TABLE = 'user';

const createNewAccount = async (username, password) => {
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    const query = knex(USER_TABLE).insert({ username, password: hashedPassword });
    console.log('Raw query for createNewUser:', query.toString());
    const result = await query;

    return result;
};

module.exports = {
    createNewAccount
};