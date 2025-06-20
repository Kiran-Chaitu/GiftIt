const { consumer } = require('../kafkaClient');
const { userProfileCreation } = require('../../controllers/CreatingUserProfileController');
const { sendToDLQ } = require('../producer/DLQProducer');

const userCreatedConsumer = async () => {
    await consumer.connect();
    await consumer.subscribe({
        topic: 'user.created',
        fromBeginning: false,
    });

    await consumer.run({
        eachMessage: async ({ topic, partition, message }) => {
            const rawValue = message.value.toString();
            let payload;

            try {
                payload = JSON.parse(rawValue);
            } catch (parseErr) {
                console.error('Invalid JSON received. Sending to DLQ:', rawValue);
                await sendToDLQ(rawValue, 'Invalid JSON format');
                return;
            }

            try {
                // ✅ Optional: Add your idempotent check here (e.g., check DB for userId)
                await userProfileCreation(payload);
            } catch (processingError) {
                console.error('Error processing message. Sending to DLQ:', processingError.message);
                await sendToDLQ(payload, processingError.message);
            }
        }
    });
};

module.exports = { userCreatedConsumer };
