import { Router } from 'express';
import { getRepository } from 'typeorm';
import { Stock } from '../models/stock';

const router = Router();

// Route to add a new stock
router.post('/stocks', async (req, res) => {
  try {
    const { symbol, name } = req.body;
    const stockRepository = getRepository(Stock);

    // Create a new Stock entity
    const newStock = stockRepository.create({ symbol, name });

    // Save the new stock to the database
    await stockRepository.save(newStock);

    // Respond with the created stock
    res.status(201).json(newStock);
  } catch (error) {
    res.status(500).json({ error: 'Error adding the stock' });
  }
});

// Route to list all stocks
router.get('/stocks', async (req, res) => {
  try {
    const stockRepository = getRepository(Stock);

    // Retrieve all stocks from the database
    const stocks = await stockRepository.find();

    // Respond with the list of stocks
    res.json(stocks);
  } catch (error) {
    res.status(500).json({ error: 'Error fetching stocks' });
  }
});

export default router;
