const knex = require('../database/knex');
const bcrypt = require('bcrypt');

const USER_TABLE = 'employee';

const createNewAccount = async (name, username, password, parking_lot, valet_certified) => {

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    const query = knex(USER_TABLE).insert({ name, username, password: hashedPassword, parking_lot, valet_certified });
    console.log('Raw query:', query.toString());
    const result = await query;

    return result;
};

const findUserByUsername = async (username) => {
    const query = await knex(USER_TABLE).where({ username });
    const result = await query;
    return result;
}

const authenticateAccount = async (username, password) => {
    const users = await findUserByUsername(username);
    console.log('Results of users query', users);
    if (users.length === 0) {
        console.error(`No users matched the username: ${username}`);
        return false;
    }
    const user = users[0];
    const validPassword = await bcrypt.compare(password, user.password);
    if (validPassword) {
        return true;
    }
    return false;
}

module.exports = {
    createNewAccount,
    authenticateAccount
};