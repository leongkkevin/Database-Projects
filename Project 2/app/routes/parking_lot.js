const express = require('express');
const router = express.Router();
const parking_lot = require('../models/parking_lot');


router.get('/:stadium_name', async (req, res, next) => {
    try {
        const stadium_spots = await parking_lot.fetchAllStadiumSpots(req.params.stadium_name);
        res.json(stadium_spots);
    } catch (err) {
        console.error('Failed to load current user:', err);
        res.sendStatus(500).json({ message: err.toString() });
    }
});

router.get('/', async (req, res, next) => {
    const allLots = await parking_lot.fetchAllLots();
    res.json(allLots);
    next();
});

module.exports = router;