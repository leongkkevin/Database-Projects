const express = require('express');
const bodyParser = require('body-parser');

const parking_lotRoutes = require('./routes/parking_lot');
const parking_spaceRoutes = require('./routes/parking_space');
const accountRoutes = require('./routes/account')
const sessionRoutes = require('./routes/session');
const allocationRoutes = require('./routes/allocation');

const { createModelsMiddleware } = require('./middleware/model-middleware');

const app = express();
const port = 3000;

app.use(createModelsMiddleware);
app.use(express.json());
app.use(bodyParser.json());

app.get('/health', (request, response, next) => {
    const responseBody = { status: 'up', port };
    response.json(responseBody);
    next();
});

app.use('/parking_lot', parking_lotRoutes);
app.use('/parking_space', parking_spaceRoutes);
app.use('/account', accountRoutes);
app.use('/session', sessionRoutes);
app.use('/allocation', allocationRoutes);

// Now that we've configured the app, make it listen for incoming requests
app.listen(port, () => {
    console.log(`This app is listening on port ${port}`);
});
