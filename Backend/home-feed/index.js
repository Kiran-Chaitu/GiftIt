const express = require('express');
const { registerWithEureka } = require('./config/EurekaClientRegistrationConfig');

const app = express();
const PORT = process.env.PORT;

app.listen(PORT, () => {
    console.log("THe server home-feed-service is listening to the port:" + PORT);
    registerWithEureka();
});