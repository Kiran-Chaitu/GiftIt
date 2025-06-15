const express = require('express');
const { userProfileRouter } = require('./UserProfileRoutes');

const routes = express.Router();

routes.use(userProfileRouter);


module.exports = { routes };