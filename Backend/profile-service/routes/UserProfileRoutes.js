const express = require('express');
const { getUserProfile } = require('../controllers/GettingUserProfileController');
const { createUserProfile } = require('../controllers/CreatingUserProfileController');
const { updateUserProfile } = require('../controllers/UpdatingUserProfileController');
const { uploadProfilePhoto } = require('../config/CloudinaryConfig');

const userProfileRouter = express.Router();

// --- THE BIG @swagger BLOCK THAT DEFINED COMPONENTS AND TAGS HAS BEEN DELETED ---

/**
 * @swagger
 * /:
 *   post:
 *     summary: Get a user profile by providing userId in the body
 *     tags: [Profiles]
 *     description: Retrieves a single user profile. This endpoint uses a POST method to accept the userId in the request body.
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [userId]
 *             properties:
 *               userId:
 *                 type: integer
 *             example:
 *               userId: 123
 *     responses:
 *       '200':
 *         description: Successfully retrieved user profile.
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/SuccessWrapper'
 *       '404':
 *         description: User not found.
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/ErrorWrapper'
 */
userProfileRouter.post('/', getUserProfile);

/**
 * @swagger
 * /create:
 *   post:
 *     summary: Create a new user profile with a profile picture
 *     tags: [Profiles]
 *     description: |
 *       Creates a new user profile. This endpoint expects a `multipart/form-data` request.
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             required: [userId, userName, userLocation, profileImage]
 *             properties:
 *               userId:
 *                 type: integer
 *               userName:
 *                 type: string
 *               userLocation:
 *                 type: string
 *               profileImage:
 *                 type: string
 *                 format: binary
 *                 description: The user's profile picture image file.
 *     responses:
 *       '201':
 *         description: Profile created successfully.
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/SuccessWrapper'
 *       '400':
 *         description: Bad Request. A required field was missing.
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/ErrorWrapper'
 */
userProfileRouter.post('/create', uploadProfilePhoto.single('profileImage'), createUserProfile);

/**
 * @swagger
 * /update:
 *   put:
 *     summary: Update an existing user profile
 *     tags: [Profiles]
 *     description: |
 *       Updates an existing user's profile. All data, including the userId, must be sent in the multipart body.
 *     requestBody:
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             required: [userId]
 *             properties:
 *               userId:
 *                 type: integer
 *                 description: The ID of the user to update.
 *               userName:
 *                 type: string
 *               userLocation:
 *                 type: string
 *               profileImage:
 *                 type: string
 *                 format: binary
 *                 description: The new profile picture image file.
 *     responses:
 *       '200':
 *         description: Profile updated successfully.
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/UpdateSuccessWrapper'
 *       '404':
 *         description: User not found.
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/ErrorWrapper'
 */
userProfileRouter.put('/update', uploadProfilePhoto.single('profileImage'), updateUserProfile);

module.exports = { userProfileRouter };