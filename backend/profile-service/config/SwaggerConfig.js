const swaggerJSDoc = require('swagger-jsdoc');

const options = {
  // 1. Main API definition
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Profile Service API',
      version: '1.0.0',
      description: 'API documentation for the user profile microservice, handling user profile data and images.',
    },
    servers: [
      {
        url: 'http://localhost:8085', // The base URL where your Node.js service is running
        description: 'Development Server',
      },
    ],
    // 2. All reusable tags and schemas are defined centrally here
    tags: [
      {
        name: 'Profiles',
        description: 'Operations related to user profiles',
      }
    ],
    components: {
      schemas: {
        UserProfile: {
          type: 'object',
          description: "The user profile data object returned on success.",
          properties: {
            user_id: { type: 'integer', description: 'The unique identifier for the user.' },
            display_name: { type: 'string', description: 'The user\'s public name.' },
            profile_photo_url: { type: 'string', description: 'The URL to the user\'s uploaded profile photo.' },
            location: { type: 'string', description: 'The geographical location of the user.' },
            createdAt: { type: 'string', format: 'date-time' },
            updatedAt: { type: 'string', format: 'date-time' }
          },
          example: {
            user_id: 123,
            display_name: "Swarup",
            profile_photo_url: "http://res.cloudinary.com/your-cloud/image/upload/v162.../some-id.jpg",
            location: "Kolkata",
            createdAt: "2024-06-18T10:00:00Z",
            updatedAt: "2024-06-18T10:00:00Z"
          }
        },
        ApiErrorResponse: {
          type: 'object',
          description: "A standardized error response object.",
          properties: {
            statusCode: { type: 'integer' },
            message: { type: 'string' },
            path: { type: 'string' }
          },
          example: {
            statusCode: 404,
            message: "No user has been found with the user_id: 999",
            path: "/update"
          }
        },
        SuccessWrapper: {
          type: 'object',
          properties: {
            message: { type: 'string', example: "successful" },
            response: { $ref: '#/components/schemas/UserProfile' }
          }
        },
        ErrorWrapper: {
          type: 'object',
          properties: {
            message: { type: 'string', example: "failed" },
            response: { $ref: '#/components/schemas/ApiErrorResponse' }
          }
        },
        UpdateSuccessWrapper: {
          type: 'object',
          description: "The response object for a successful update operation.",
          properties: {
            message: { type: 'string', example: "successful" },
            response: { type: 'integer', description: 'The number of records updated.', example: 1 }
          }
        }
      }
    }
  },
  // 3. The path to your route files, relative to the project root.
  apis: ['./routes/*.js'],
};

const swaggerSpecification = swaggerJSDoc(options);

// Export the spec object directly.
module.exports = { swaggerSpecification };