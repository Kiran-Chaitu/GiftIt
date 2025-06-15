const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/DatabaseConnectionConfig');

const userProfile = sequelize.define('userProfile', {

    user_id : {
      type:DataTypes.BIGINT,
      primaryKey:true,
    },
    display_name: {
        type:DataTypes.STRING,
        allowNull:false,
    },
    profile_photo_url: {
        type:DataTypes.STRING,
    },
    location: {
        type:DataTypes.STRING,
    },
    bio: {
        type:DataTypes.TEXT,
    },
}, {

    tableName:'user_profiles',
    timestamps:true,
    createdAt:'created_at',
    updatedAt:'updated_at',
});


module.exports = { userProfile };