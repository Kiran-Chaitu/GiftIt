const { Kafka } = require('kafkajs');
const kafka = new Kafka({
    clientId: 'profile-service',
    brokers: [process.env.KAFKA_BROKER],
});

const producer = kafka.producer();
const consumer = kafka.consumer({
    groupId: 'profile-group'
});

module.exports = { kafka, producer, consumer };
