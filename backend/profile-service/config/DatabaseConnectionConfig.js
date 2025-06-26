const { Sequelize } = require('sequelize');

const sequelize = new Sequelize(
    process.env.SQL_NAME,
    process.env.SQL_USER,
    process.env.SQL_PASSWORD,
    {
        host:process.env.SQL_HOST,
        dialect:'mysql',
    },
);

const databaseConnection = async () => {
    try {
        await sequelize.authenticate();
        await sequelize.sync();
        console.log("Database Connection has been successfully connected");
    } catch(error) {
        console.log("Unable to connect to database:", error);
    }
};


module.exports = { sequelize, databaseConnection };