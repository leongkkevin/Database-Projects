const express = require('express');

// const studentRoutes = require('./routes/student');


const { createModelsMiddleware, disconnectFromDatababaseMiddleware } = require('./middleware/model-middleware');

const app = express();
const port = 3000;

app.use(createModelsMiddleware);

app.get('/health', (req, res, next) => {
    const responseBody = { status: 'up', port };
    response.json(responseBody);
    next();
});

app.use(disconnectFromDatababaseMiddleware);

app.listen(port, () => {
    console.log(`This app is listening on port ${port}`);
});