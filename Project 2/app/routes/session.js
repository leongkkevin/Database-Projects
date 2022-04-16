const express = require('express');
const jwt = require('jsonwebtoken');

const router = express.Router();

router.post('/', async (req, res, next) => {
    try {
        const body = req.body;
        
        var result = await req.models.employee.authenticateAccount(body.username, body.password);

        if (result) {
            const token = jwt.sign( { username: body.username, password: body.password }, 'abc');
            req.models.session.createSession(token, body.username);

            result = token
        }

        res.status(201).json(result);

    } catch (err) {
        console.error('Failed to create new session:', err);
        res.status(401).json({ message: err.toString() });
    }

    next();
})

router.get('/', async (req, res, next) => {
    try {
        const token = req.body.token;

        const result = await req.models.session.getSession(token);
        res.status(200).json(result);
    } catch (err) {
        console.error('Failed to get session by token: ', err);
        res.status(500)
    }
    next()
})



module.exports = router;