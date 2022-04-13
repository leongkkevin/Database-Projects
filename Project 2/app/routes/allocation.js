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
            res.status(201).json({success: 1, error: ""}).send();   
    })
    } catch (error) {
        return next(error);
    }
});

router.delete('/:allocation_id', async (req, res, next) => {
    try{ 
        await allocation.deleteAllocation(req.params.allocation_id).then( function() {
            res.status(204).json({success: 1, error: ""}).send();   

        })
    } catch (error){
        return next(error);
    }
});

router.put('/:allocation_id', async (req, res, next) => {
    try{ 
        await allocation.putAllocation(req.params.allocation_id, req.body).then( function() {
            res.status(200).json({success: 1, error: ""}).send();   

        })
    } catch (error){
        return next(error);
    }
});


module.exports = router;