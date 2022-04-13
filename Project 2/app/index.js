const express = require('express');
const bodyParser = require('body-parser');

const parking_lotRoutes = require('./routes/parking_lot');
const parking_spaceRoutes = require('./routes/parking_space');
const employeeRoutes = require('./routes/account')
const sessionRoutes = require('./routes/session');

// Import any middleware here
const { createModelsMiddleware } = require('./middleware/model-middleware');

// Start by defining the express app instance
const app = express();
const port = 3000;

// On every request, this gets called first. This is the first step in our "middleware chain".
// We put this before anything else because we know our route handlers are going to need connections
// to the database
app.use(createModelsMiddleware);
app.use(bodyParser.json());

// Add a health route. Note the new argument: next
app.get('/health', (request, response, next) => {
    const responseBody = { status: 'up', port };
    response.json(responseBody);
    // next() is how we tell express to continue through the middleware chain
    next();
});

app.use('/parking_lot', parking_lotRoutes);
app.use('/parking_space', parking_spaceRoutes);
app.use('/account', employeeRoutes);
app.use('/session', sessionRoutes);

// Now that we've configured the app, make it listen for incoming requests
app.listen(port, () => {
    console.log(`This app is listening on port ${port}`);
});
