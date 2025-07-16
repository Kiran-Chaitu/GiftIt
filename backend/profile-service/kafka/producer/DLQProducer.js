const { producer } = require('../kafkaClient');
const { v4: uuidv4 } = require('uuid');

const sendToDLQ = async (originalPayload, reason) => {
    const payload = {
        id: uuidv4(), 
        originalPayload,
        timestamp: new Date().toISOString(),
        reason: reason || 'Unknown Error'
    };

    // Only connect once per app lifetime (not every time)
    if (!producer.isConnected) {
        await producer.connect();
        producer.isConnected = true; 
    }

    await producer.send({
        topic: 'user.created.DLT',
        messages: [ 
            { value: JSON.stringify(payload) }
        ],
    });
};

module.exports = { sendToDLQ };
