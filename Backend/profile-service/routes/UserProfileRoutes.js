const expres = require('express');
const { getUserProfileDetails } = require('../controllers/GettingUserProfileDetailsControllers');

const userProfileRouter = expres.Router();

userProfileRouter.get('/api/profile-details/user/all', getUserProfileDetails);

// userProfileRouter.post('/api/profile-details/user/updates', );

module.exports = { userProfileRouter };