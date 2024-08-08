import 'reflect-metadata';
import express from 'express';
import { DataSource } from 'typeorm';
import { Stock } from './models/stock';

// Initialize TypeORM Data Source
export const AppDataSource = new DataSource({
  type: 'postgres',
  host: 'localhost',
  port: 5432,
  username: 'postgres',
  password: 'postgres',
  database: 'portfolio',
  synchronize: true, // Automatically creates database schema
  logging: false,
  entities: [Stock],
});

// Create Express Application
const app = express();
const PORT = process.env.PORT || 3001; // Default port for the application

app.use(express.json());

// Define routes
app.get('/stocks', async (req, res) => {
  try {
    const stockRepository = AppDataSource.getRepository(Stock);
    const stocks = await stockRepository.find();
    res.json(stocks);
  } catch (error) {
    console.error('Error fetching stocks:', error);
    res.status(500).json({ message: 'Error fetching stocks' });
  }
});

app.post('/stocks', async (req, res) => {
  try {
    const stockRepository = AppDataSource.getRepository(Stock);
    const newStock = stockRepository.create(req.body);
    await stockRepository.save(newStock);
    res.status(201).json(newStock);
  } catch (error) {
    console.error('Error saving stock:', error);
    res.status(500).json({ message: 'Error saving stock' });
  }
});

// Start Server and Initialize Data Source
const startServer = async () => {
  try {
    await AppDataSource.initialize();
    console.log('Data Source has been initialized!');
    
    app.listen(PORT, () => {
      console.log(`Server is running on port ${PORT}`);
    });
  } catch (error) {
    console.error('Error during Data Source initialization:', error);
  }
};

startServer();
