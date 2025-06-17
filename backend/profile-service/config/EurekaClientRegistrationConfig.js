const { Eureka } = require('eureka-js-client');

let client;

const registerWithEureka = () => {
    client = new Eureka({
        instance: {
            instanceId: `${process.env.APP_NAME}:${process.env.PORT}`,
            app: process.env.APP_NAME,
            hostName: 'localhost',
            ipAddr: '127.0.0.1',
            statusPageUrl: `http://localhost:${process.env.PORT}/status`,
            vipAddress: process.env.APP_NAME,
            port: {
                '$': process.env.PORT,
                '@enabled': true
            },
            dataCenterInfo: {
                '@class': 'com.netflix.appinfo.InstanceInfo$DefaultDataCenterInfo',
                name: 'MyOwn',
            },
            // leaseInfo: {
            //     renewalIntervalInSecs: 5,       // client sends heartbeat every 5s
            //     durationInSecs: 10,               // if no heartbeat for 10s, mark dead
            // }
        },
        eureka: {
            host: process.env.EUREKA_HOST,
            port: process.env.EUREKA_PORT,
            servicePath: process.env.EUREKA_SERVICE_PATH,
        }
    });

    client.logger.level('debug'); // optional: for deeper logs

    client.start(error => {
        console.log(error || 'Node.js service registered with Eureka');
    });
};

module.exports = { registerWithEureka };
