const express = require('express');
const knex = require('../database/knex');

const router = express.Router();

router.post('/', async (req, res, next) => {
    try {
        const body = req.body;
        console.log(body);

        if (body.name === undefined) body.name = null;
        if (body.parking_lot === undefined) body.parking_lot = null;
        if (body.valet_certified === undefined) body.valet_certified = null;

        const result = await req.models.employee.createNewAccount(body.name, body.username, body.password, body.parking_lot, body.valet_certified);
        res.status(201).json(result);
    } catch (err) {
        console.error('Failed to create new account:', err);
        res.status(400).json({ message: err.toString() });
    }
    next();
})

module.exports = router;