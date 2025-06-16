const { userProfile } = require('../models/userProfileModel');
const { ApiErrorResponse } = require('../utils/ApiErrorResponse');

const updateUserProfile = async (req, res) => {
    const userName = req.body.userName;
    const userLocation = req.body.userLocation;
    const userId = req.body.userId;
    const profilePhoto = req.file.path;
    const fileToUpdate = {
        user_name: userName,
        user_location: userLocation,
        profile_photo_url: profilePhoto,
    };
    try {
        const [rowsChanged] = await userProfile.update(fileToUpdate, {
            where: {user_id: userId}
        });
        if (rowsChanged == 0) {
            const errorMessage = "No user has been found with the user_id:" + userId;
            const serverError = new ApiErrorResponse(404, errorMessage, req.originalUrl);
            return res.status(404).json({
                message:"failed",
                response: serverError
        });
        }
        res.status(200).json({
                message:"successful",
                response: rowsChanged
        });
    } catch(error) {
        const errorMessage = 'An unexpected internal server error has occured';
        const serverError = new ApiErrorResponse(500, errorMessage, req.originalUrl);
        return res.status(500).json({
                message:"failed",
                response: serverError
        });
    }
}

module.exports = { updateUserProfile };