const { Eureka } = require('eureka-js-client');

const registerWithEureka = () => {
    const client = new Eureka({
        instance: {
            instanceId:`${process.env.APP_NAME}:${process.env.PORT}`,
            app:process.env.APP_NAME,
            hostName:'localhost',
            ipAddr:'127.0.0.1',
            port: {
                '$':process.env.PORT,
                '@enabled':true,
            },
            vipAddress:process.env.APP_NAME,
            dataCenterInfo: {
                '@class':'com.netflix.appinfo.InstanceInfo$DefaultDataCenterInfo',
                name:'MyOwn',
            },
        },
        eureka: {
            host:process.env.EUREKA_HOST,
            port:process.env.EUREKA_PORT,
            servicePath:process.env.EUREKA_SERVICE_PATH,
        }
    });

    client.start((error) => {
        console.log(error || 'Node.js service registered with Eureka');
    })
}

module.exports = { registerWithEureka };