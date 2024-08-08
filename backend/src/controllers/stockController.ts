import { Request, Response } from 'express';
import { getRepository } from 'typeorm';
import { Stock } from '../models/stock';

export const getStocks = async (req: Request, res: Response) => {
  const stockRepository = getRepository(Stock);
  const stocks = await stockRepository.find();
  res.json(stocks);
};
