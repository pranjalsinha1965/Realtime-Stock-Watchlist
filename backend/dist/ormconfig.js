"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AppDataSource = void 0;
const typeorm_1 = require("typeorm");
const stock_1 = require("./models/stock"); // Import your entity
exports.AppDataSource = new typeorm_1.DataSource({
    type: 'postgres',
    host: 'localhost', // Change to your PostgreSQL host
    port: 5432, // Default PostgreSQL port
    username: 'postgres', // Change to your PostgreSQL username
    password: 'postgres', // Change to your PostgreSQL password
    database: 'portfolio', // Change to your PostgreSQL database name
    synchronize: true, // Set to false in production
    logging: false, // Set to true if you want to log SQL queries
    entities: [stock_1.Stock], // Include your entities
});
