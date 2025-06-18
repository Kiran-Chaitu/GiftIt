const { consumer } = require('../kafkaClient');
const { userProfileCreation } = require('../../controllers/CreatingUserProfileController');

const userCreatedConsumer = async () => {
    await consumer.connect();
    await consumer.subscribe({
        topic: 'user.created',
        fromBegining: false,
    });

    await consumer.run({
        eachMessage: async({ message }) => {
            const payload = JSON.parse(message.value.toString());
            await userProfileCreation(payload);
        }
    });
};

module.exports = { userCreatedConsumer };