import { Router } from 'express';
import { getRepository } from 'typeorm';
import { Stock } from './models/Stock';

const router = Router();

// Add a new stock
router.post('/stocks', async (req, res) => {
  const { symbol, name } = req.body;
  const stockRepository = getRepository(Stock);

  const newStock = stockRepository.create({ symbol, name });
  await stockRepository.save(newStock);

  res.status(201).json(newStock);
});

// List all stocks
router.get('/stocks', async (req, res) => {
  const stockRepository = getRepository(Stock);
  const stocks = await stockRepository.find();
  res.json(stocks);
});

export default router;
