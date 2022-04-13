const express = require('express');
const bodyParser = require('body-parser');

const parking_lotRoutes = require('./routes/parking_lot');
const parking_spaceRoutes = require('./routes/parking_space');

const app = express();
const port = 3000;

app.use(bodyParser.json());

app.get('/health', (req, res, next) => {
    const responseBody = { status: 'up', port };
    res.json(responseBody);
    next();
});

app.use('/parking_lot', parking_lotRoutes);
app.use('/parking_space', parking_spaceRoutes);

app.listen(port, () => {
    console.log(`This app is listening on port ${port}`);
});