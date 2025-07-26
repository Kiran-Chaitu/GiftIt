const { userProfile } = require('../models/UserProfileModel');
const { sendToDLQ } = require('../kafka/producer/DLQProducer');

const userProfileCreation = async (payload) => {
    const { userId, userName, userLocation, userPhoneNumber } = payload;
    console.log(payload);

    if (!userId || !userName || !userLocation || !userPhoneNumber) {
        return await sendToDLQ(payload, 'Missing fields');
    }

    try {
        const userExisted = await userProfile.findByPk(userId);
        if (userExisted) {
                console.log("user already exists");
                return;
        }
        await userProfile.create({
            user_id: userId,
        display_name: userName,
        location: userLocation,
        mobile_number: userPhoneNumber,
        profile_photo_url: null,
        });
        console.log("successfully user created");
    } catch(error) {
        await sendToDLQ(payload, error.message);
    }

}

module.exports = { userProfileCreation };