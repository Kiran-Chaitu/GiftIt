const { producer } = require('../kafkaClient');
const { v4: uuidv4 } = require('uuid');

const sendToDLQ = async (originalPayload, reason) => {
    const payload = {
        id: uuidv4,
        originalPayload,
        timestamp:new Date().toISOString(),
    };

    await producer.connect();

    await producer.send({
        topic: 'user.created.dlq',
        message: [{ value: JSON.stringify(payload)}],
    });

}

module.exports = { sendToDLQ };