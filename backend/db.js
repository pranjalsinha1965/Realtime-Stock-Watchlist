const { Pool } = require('pg');

const pool = new Pool({
  host: process.env.DATABASE_HOST || 'localhost', // Service name from docker-compose.yml
  user: process.env.DATABASE_USER || 'postgres',
  port: process.env.DATABASE_PORT || 5432,
  database: process.env.DATABASE_NAME || 'portfolio',
  password: process.env.DATABASE_PASSWORD || 'postgres',
  ssl: process.env.DATABASE_SSL || false
});

module.exports = { pool };
