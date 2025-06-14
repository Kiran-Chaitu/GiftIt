const express = require('express');
const { registerWithEureka } = require('./config/EurekaClientRegistrationConfig');

const app = express();
const PORT = process.env.PORT;



app.listen(PORT, () => {
    console.log("The server Profile-service is successfully listening to port:" + PORT);
   registerWithEureka();
});