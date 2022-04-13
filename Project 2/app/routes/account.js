const express = require('express');
const knex = require('../database/knex');

const router = express.Router();

router.post('/', async (req, res, next) => {
    try {
        const body = req.body;
        console.log(body);
        const result = await req.models.account.createNewAccount(body.username, body.password);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to create new account:', err);
        res.status(500).json({ message: err.toString() });
    }
    next();
})

module.exports = router;