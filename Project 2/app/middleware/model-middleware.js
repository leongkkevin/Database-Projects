const connectToDatabase = require('../models/db-help');

const createModelsMiddleware = async (req, res, next) => {
    console.log('Connecting to the database');
    const { DBquery, disconnect } = await connectToDatabase();
    req.models = {
        // student: new Student(DBQuery, disconnect),
        // professor: new Professor(DBQuery, disconnect)
    }
    req.disconnect = disconnect;
    next();
}

const disconnectFromDatababaseMiddleware = (req, res, next) => {
    console.log('Disconnecting from the database');
    req.disconnect();
    next();
}

module.exports = {
    createModelsMiddleware,
    disconnectFromDatababaseMiddleware
}