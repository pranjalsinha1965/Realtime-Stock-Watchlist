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
exports.getStocks = void 0;
const typeorm_1 = require("typeorm");
const stock_1 = require("../models/stock");
const getStocks = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const stockRepository = (0, typeorm_1.getRepository)(stock_1.Stock);
    const stocks = yield stockRepository.find();
    res.json(stocks);
});
exports.getStocks = getStocks;
