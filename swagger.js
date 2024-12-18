import swaggerJsDoc from 'swagger-jsdoc';
import { serve, setup } from 'swagger-ui-express';

const swaggerOptions = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'API Documentation',
      version: '1.0.0',
      description: 'Dokumentasi API menggunakan Swagger di Elysia',
    },
    servers: [
      {
        url: 'http://localhost:3000',
      },
    ],
  },
  apis: ['./routes/*.js'], // Sesuaikan lokasi file API
};

export const swaggerDocs = swaggerJsDoc(swaggerOptions);
export const swaggerUiServe = serve;
export const swaggerUiSetup = setup(swaggerDocs);
