const { userProfile } = require('../models/UserProfileModel');
const { ApiErrorResponse } = require('../utils/ApiErrorResponse');



const getUserProfile = async (req, res) => {
    try {
        
        const user_id =  req.headers['x-user-id'];
        const userProfileData = await userProfile.findByPk(user_id);
        if (userProfileData == null) {
            const errorMessage = 'No user has been found with the user_id:' + user_id;
            const clientError = new ApiErrorResponse(404, errorMessage, req.originalUrl);
            return res.status(404).json({
                response: clientError
            });
        }
        return res.status(200).json({
            response: userProfileData
    });
    } catch(error) {
        const errorMessage = 'An unexpected internal server error has occured';
        const serverError = new ApiErrorResponse(500, errorMessage, req.originalUrl);
        console.log(error);
        return res.status(500).json({
            response: serverError
    });
    }
}




module.exports = { getUserProfile };