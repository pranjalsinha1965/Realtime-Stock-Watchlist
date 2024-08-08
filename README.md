# Real-Time Stock Watchlist Management Web Application

## Overview

This application allows users to manage a stock watchlist with features to add and view stocks. It is built using Flutter and Dart for the frontend and TypeScript with Express and PostgreSQL for the backend. The backend is containerized using Docker.

## Tech Stack

- **Frontend**: Flutter, Dart
- **Backend**: TypeScript, Express, PostgreSQL
- **Database**: PostgreSQL
- **Containerization**: Docker

## Features

- **Frontend**: 
  - Add stocks to the watchlist
  - View stocks in the watchlist

- **Backend**: 
  - REST API for managing stocks
  - Integration with PostgreSQL database

## Project Structure

- **Frontend**:
  - `lib/main.dart` - Main entry point for the Flutter application
  - `test/widget_test.dart` - Widget tests for the Flutter application

- **Backend**:
  - `src/db.ts` - Database configuration and connection
  - `src/index.ts` - Entry point for the Express application
  - `src/routes/stockRoutes.ts` - API routes for stock management

## Setup Instructions

### Prerequisites

- PostgreSQL

### Backend Setup

1. **Clone the Repository**

   ```bash
   git clone <https://github.com/pranjalsinha1965/Realtime_Stock_Watchlist.git>
   cd realtime_stock_watchlist
