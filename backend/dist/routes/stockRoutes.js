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
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const typeorm_1 = require("typeorm");
const stock_1 = require("../models/stock");
const router = (0, express_1.Router)();
// Route to add a new stock
router.post('/stocks', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { symbol, name } = req.body;
        const stockRepository = (0, typeorm_1.getRepository)(stock_1.Stock);
        // Create a new Stock entity
        const newStock = stockRepository.create({ symbol, name });
        // Save the new stock to the database
        yield stockRepository.save(newStock);
        // Respond with the created stock
        res.status(201).json(newStock);
    }
    catch (error) {
        res.status(500).json({ error: 'Error adding the stock' });
    }
}));
// Route to list all stocks
router.get('/stocks', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const stockRepository = (0, typeorm_1.getRepository)(stock_1.Stock);
        // Retrieve all stocks from the database
        const stocks = yield stockRepository.find();
        // Respond with the list of stocks
        res.json(stocks);
    }
    catch (error) {
        res.status(500).json({ error: 'Error fetching stocks' });
    }
}));
exports.default = router;
