const express = require('express');
const router = express.Router();
const parking_space = require('../models/parking_space');

router.get('/', async (req, res, next) => {
    const spots = await parking_space.fetchSpots(req.query.stadium, req.query.lot, req.query.available);
    res.json(spots);
    next();
});

module.exports = router;