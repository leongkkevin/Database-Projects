const express = require('express');
const router = express.Router();
const allocation = require('../models/allocation');

router.get('/', async (req, res, next) => {
    const allAllocations = await allocation.fetchAllAllocations();
    res.json(allAllocations);
    next();
});

router.post('/', async (req, res, next) => {
    let parking_space = req.body.parking_space
    let car = req.body.car

    try {
        await allocation.postAllocation(parking_space, car).then( function (result) {
            res.status(200).json({success: 1, error: ""}).send();   
    })
    } catch (error) {
        return next(error);
    }
});

module.exports = router;