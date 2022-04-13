const express = require('express');
const router = express.Router();
const parking_space = require('../models/parking_space');

router.get('/', async (req, res, next) => {
    try {
        console.log(req.query)
        const spots = await parking_space.fetchSpots(req.query.stadium, req.query.lot, req.query.available)
        res.sendStatus(200).json(spots);
    } catch (err) {
        console.error('Failed to load current user:', err);
        res.sendStatus(500).json({ message: err.toString() });
    }
});

module.exports = router;