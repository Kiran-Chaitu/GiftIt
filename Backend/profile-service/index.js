const express = require('express');
const cors = require('cors');
const { registerWithEureka } = require('./config/EurekaClientRegistrationConfig');
const { databaseConnection } = require('./config/DatabaseConnectionConfig');
const { routes } = require('./routes/completeRoutes');

const app = express();
const PORT = process.env.PORT;
app.use(cors());
app.use(express.json());
app.use(routes);


app.listen(PORT, () => {
    console.log("The server Profile-service is successfully listening to port:" + PORT);
   registerWithEureka();
   databaseConnection();
});

