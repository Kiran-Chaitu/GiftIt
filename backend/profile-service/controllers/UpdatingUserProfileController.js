const { userProfile } = require('../models/UserProfileModel');
const { ApiErrorResponse } = require('../utils/ApiErrorResponse');

const updateUserProfile = async (req, res) => {
    console.log('BODY:', req.body);
    console.log('FILE:', req.file);
    const userName = req.body.userName;
    const userLocation = req.body.userLocation;
    const userId = req.headers['x-user-id'];
    const profilePhoto = req.file.path || "";
    const userPhoneNumber = req.body.userPhoneNumber;
    console.log(userPhoneNumber);
    const fileToUpdate = {
        user_name: userName,
        user_location: userLocation,
        profile_photo_url: profilePhoto,
        mobile_number:userPhoneNumber,
    };
    console.log(fileToUpdate);
    try {
        const [rowsChanged] = await userProfile.update(fileToUpdate, {
            where: {user_id: Number(userId)}
        });
        if (rowsChanged == 0) {
            const errorMessage = "No user has been found with the user_id:" + userId;
            const serverError = new ApiErrorResponse(404, errorMessage, req.originalUrl);
            return res.status(404).json({
                response: serverError
        });
        }
        res.status(200).json({
                response: rowsChanged
        });
    } catch(error) {
        const errorMessage = 'An unexpected internal server error has occured';
        const serverError = new ApiErrorResponse(500, errorMessage, req.originalUrl);
        return res.status(500).json({
                response: serverError
        });
    }
}

module.exports = { updateUserProfile };