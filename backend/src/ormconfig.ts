import { DataSource } from 'typeorm';
import { Stock } from './models/stock';  // Import your entity

export const AppDataSource = new DataSource({
  type: 'postgres',
  host: 'localhost',       // Change to your PostgreSQL host
  port: 5432,              // Default PostgreSQL port
  username: 'postgres',    // Change to your PostgreSQL username
  password: 'postgres',    // Change to your PostgreSQL password
  database: 'portfolio',   // Change to your PostgreSQL database name
  synchronize: true,       // Set to false in production
  logging: false,          // Set to true if you want to log SQL queries
  entities: [Stock],       // Include your entities
});
