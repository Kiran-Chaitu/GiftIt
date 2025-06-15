const { userProfile } = require('../models/userProfileModel');
const { ApiErrorResponse } = require('../utils/ApiErrorResponse');



const getUserProfileDetails = async (req, res) => {

    console.log(req.body);
    try {
        const user_id = req.body.userId;
        const userProfileData = await userProfile.findByPk(user_id);
        if (userProfileData == null) {
            const errorMessage = 'No user has been found with the user_id:' + user_id;
            const clientError = new ApiErrorResponse(404, errorMessage, req.originalUrl);
            return res.status(404).json(clientError);
        }
        return res.status(200).json(userProfileData);
    } catch(error) {
        const errorMessage = 'An unexpected internal server error has occured';
        const serverError = new ApiErrorResponse(500, errorMessage, req.originalUrl);
        console.log(error);
        return res.status(500).json(serverError);
    }
}




module.exports = { getUserProfileDetails };