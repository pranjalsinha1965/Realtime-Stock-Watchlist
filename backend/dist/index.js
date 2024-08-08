"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AppDataSource = void 0;
const typeorm_1 = require("typeorm");
const stock_1 = require("./models/stock");
exports.AppDataSource = new typeorm_1.DataSource({
    type: 'postgres',
    host: 'localhost',
    port: 5432,
    username: 'postgres',
    password: 'postgres',
    database: 'portfolio',
    synchronize: true, // Automatically creates database schema
    logging: false,
    entities: [stock_1.Stock],
});
