const { kafka } = require('kafkajs');
const brokers = ['localhost:9092'];

const kafka = new kafka({
    clientId:'profile-service',
    brokers:brokers,
});

