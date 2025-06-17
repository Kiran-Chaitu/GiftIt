const express = require('express');
const cors = require('cors');
const swaggerUi = require('swagger-ui-express');
const { swaggerSpecification } = require('./config/SwaggerConfig');
const { registerWithEureka } = require('./config/EurekaClientRegistrationConfig');
const { databaseConnection } = require('./config/DatabaseConnectionConfig');
const { userProfileRouter } = require('./routes/UserProfileRoutes');

const app = express();
const PORT = process.env.PORT;
app.use(cors());
app.use(express.json());
app.use('/api/profile-details/user', userProfileRouter);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpecification));

app.get('/v3/api-docs', (req, res) => {
  res.setHeader('Content-Type', 'application/json');
  res.send(swaggerSpecification);
});

app.listen(PORT, () => {
    console.log("The server Profile-service is successfully listening to port:" + PORT);
   registerWithEureka();
   databaseConnection();
});


