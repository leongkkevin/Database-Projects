const express = require('express');

const router = express.Router();

router.post('/', async (req, res, next) => {
    try {
        const body = req.body;
        
        const result = await req.models.employee.authenticateAccount(body.username, body.password);

        if (result) {
            req.models.session.createSession()
        }

        res.status(201).json(result);

    } catch (err) {
        console.error('Failed to create new user:', err);
        res.status(500).json({ message: err.toString() });
    }

    next();
})

router.get('/', async (req, res, next) => {
    try {
        const token = req.body;

        const result = await req.models.session
    } catch (err) {
        console.error('Failed to get session with token:', err);
        res.status()
    }
})



module.exports = router;