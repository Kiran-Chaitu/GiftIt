const { userProfile } = require('../models/userProfileModel');
const { ApiErrorResponse } = require('../utils/ApiErrorResponse');

const createUserProfile = async (req, res) => {
    const userName = req.body.userName;
    const userLocation = req.body.userLocation;
    const userPhoneNumber = req.body.userPhoneNumber;
    const profilePhoto = req.file
    const userId = req.body.userId;
    console.log(req.body);
    if (!userName || !userLocation || !userPhoneNumber) {
        var errorMessage = !userName ? 'name' : !userLocation ? 'location' : 'phone number';
        errorMessage = "Please enter your " + errorMessage + " properly";
        console.log(errorMessage);
        const clientError = new ApiErrorResponse(400, errorMessage, req.originalUrl);
        console.log(clientError);
        return res.status(400).json({
            message: "failed",
            response: clientError
    });
    }
    if (!profilePhoto) {
        req.file = {
            path:null,
        }
    }
    try {
        const response = await userProfile.create({
            user_id:userId,
            display_name:userName,
            profile_photo_url:req.file.path,
            location:userLocation,
            mobile_number:userPhoneNumber,
        });
        if (!response) {
            const errorMessage = "The profile-service is unable to create the profile for the user:" + userId;
            const serverError = new ApiErrorResponse(500, errorMessage, req.originalUrl);
            return res.status(500).json({
                message:"failsed",
                response: serverError
        });
        }
        return res.status(201).json({
                message:"successful",
                response: response
        });
    } catch(error) {
            const errorMessage = "The profile-service is unable to create the profile for the user:" + userId;
            const serverError = new ApiErrorResponse(500, errorMessage, req.originalUrl);
            return res.status(500).json({
                message:"failed",
                response: serverError
        });
    }
}

module.exports = { createUserProfile };