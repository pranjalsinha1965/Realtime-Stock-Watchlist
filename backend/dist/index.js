"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AppDataSource = void 0;
require("reflect-metadata");
const express_1 = __importDefault(require("express"));
const typeorm_1 = require("typeorm");
const stock_1 = require("./models/stock");
// Initialize TypeORM Data Source
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
// Create Express Application
const app = (0, express_1.default)();
const PORT = process.env.PORT || 3001; // Default port for the application
app.use(express_1.default.json());
// Define routes
app.get('/stocks', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const stockRepository = exports.AppDataSource.getRepository(stock_1.Stock);
        const stocks = yield stockRepository.find();
        res.json(stocks);
    }
    catch (error) {
        console.error('Error fetching stocks:', error);
        res.status(500).json({ message: 'Error fetching stocks' });
    }
}));
app.post('/stocks', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const stockRepository = exports.AppDataSource.getRepository(stock_1.Stock);
        const newStock = stockRepository.create(req.body);
        yield stockRepository.save(newStock);
        res.status(201).json(newStock);
    }
    catch (error) {
        console.error('Error saving stock:', error);
        res.status(500).json({ message: 'Error saving stock' });
    }
}));
// Start Server and Initialize Data Source
const startServer = () => __awaiter(void 0, void 0, void 0, function* () {
    try {
        yield exports.AppDataSource.initialize();
        console.log('Data Source has been initialized!');
        app.listen(PORT, () => {
            console.log(`Server is running on port ${PORT}`);
        });
    }
    catch (error) {
        console.error('Error during Data Source initialization:', error);
    }
});
startServer();
