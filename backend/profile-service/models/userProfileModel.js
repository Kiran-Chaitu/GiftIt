const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/DatabaseConnectionConfig');

const userProfile = sequelize.define('userProfile', {

    user_id : {
      type:DataTypes.BIGINT,
      primaryKey:true,
    },
    user_name: {
        type:DataTypes.STRING,
        allowNull:false,
    },
    profile_photo_url: {
        type:DataTypes.STRING,
    },
    user_location: {
        type:DataTypes.STRING,
        allowNull:false,
    },
    mobile_number: {
        type:DataTypes.STRING,
        allowNull:false
    },
}, {

    tableName:'user_profiles',
    timestamps:true,
    createdAt:'created_at',
    updatedAt:'updated_at',
});

module.exports = { userProfile };