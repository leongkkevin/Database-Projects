const express = require('express');
const router = express.Router();
const parking_space = require('../models/parking_space');

router.get('/', async (req, res, next) => {
    const allSpots = await parking_space.fetchAllSpots();
    res.json(allSpots);
    next();
});

router.get('/:stadium_id?/:lot_id?/:available?', async (req, res, next) => {
    try {
        const spots = await parking_space.fetchSpots(req.params.stadium_id, req.params.lot_id, req.params.available)
        res.json(spots);
    } catch (err) {
        console.error('Failed to load current user:', err);
        res.sendStatus(500).json({ message: err.toString() });
    }
});

module.exports = router;