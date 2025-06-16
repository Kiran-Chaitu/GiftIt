const { userProfile } = require('../models/userProfileModel');
const { ApiErrorResponse } = require('../utils/ApiErrorResponse');

const createUserProfile = async (req, res) => {
    const userName = req.body.userName;
    const userLocation = req.body.userLocation;
    const userId = req.body.userId;
    console.log(req.body);
    if (!userName || !userLocation) {
        var errorMessage = !userName ? 'name' : 'location';
        errorMessage = "Please enter your " + errorMessage + " properly";
        console.log(errorMessage);
        const clientError = new ApiErrorResponse(400, errorMessage, req.originalUrl);
        console.log(clientError);
        return res.status(400).json({
            message: "failed",
            response: clientError
    });
    }
    if (!req.file) {
        req.file = {
            path:null,
        }
    }
    try {
        const response = await userProfile.create({
            user_id:userId,
            display_name:userName,
            profile_photo_url:req.file.path,
            location:userLocation
        });
        if (!response) {
            const errorMessage = "The profile-service is unable to create the profile for the user:" + userId;
            const serverError = new ApiErrorResponse(500, errorMessage, req.originalUrl);
            return res.status(500).json({
                message:"failsed",
                response: serverError
        });
        }
        // console.log("hello");
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