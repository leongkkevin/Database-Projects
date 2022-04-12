const express = require('express');
const bodyParser = require('body-parser');

const parking_lotRoutes = require('./routes/parking_lot');

const app = express();
const port = 3000;

app.use(bodyParser.json());

app.get('/health', (req, res, next) => {
    const responseBody = { status: 'up', port };
    res.json(responseBody);
    next();
});

app.use('/parking_lot', parking_lotRoutes);

app.listen(port, () => {
    console.log(`This app is listening on port ${port}`);
});