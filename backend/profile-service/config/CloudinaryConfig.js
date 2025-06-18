const cloudinary = require('cloudinary').v2;
const multer = require('multer');
const { CloudinaryStorage } = require('multer-storage-cloudinary');

cloudinary.config({
    cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
    api_key: process.env.CLOUDINARY_API_KEY,
    clouapi_secret: process.env.CLOUDINARY_SECRET_KEY,
});

const cloudinaryProfileStorage = new CloudinaryStorage({
    cloudinary: cloudinary,
    params: {
        folder:"user-profile-photos",
        allowed_folders: ['jpg', 'png', 'jpeg'],
    },
});

const uploadProfilePhoto = multer({
    storage: cloudinaryProfileStorage,
});

module.exports = { cloudinaryProfileStorage, uploadProfilePhoto};