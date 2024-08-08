-- init.sql

-- \c postgres

-- Create the database if it does not exist
-- DO $$
-- BEGIN
--    IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'portfolio') THEN
--       CREATE DATABASE portfolio;
--    END IF;
-- END
-- $$;

-- Connect to the portfolio     database
-- \c portfolio

-- Create the stock table if it does not exist
-- CREATE TABLE IF NOT EXISTS stock (
--   id SERIAL PRIMARY KEY,
--   name VARCHAR(255) NOT NULL UNIQUE,
--   price DECIMAL NOT NULL
-- );

-- Insert initial data
-- INSERT INTO stock (name, price) VALUES
-- ('Apple', 150.00),
-- ('Google', 2800.00),
-- ('Amazon', 3400.00)
-- ON CONFLICT (name) DO NOTHING;

