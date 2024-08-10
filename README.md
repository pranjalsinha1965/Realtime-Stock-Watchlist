# Real-Time Stock Watchlist Management Web Application

## Fundsroom-Round1

Submission Link: https://docs.google.com/forms/d/e/1FAIpQLSfwoyREEYWLTEdZxBMLPM_BqmoaGTbVoP7bBJNEFw2-wXwXMg/viewform

Working on ChatPGT Response:
Sure, let's include a specific feature related to portfolio tracking, a common feature in Upstox, Groww, or Angel One. We'll expand the TODO app to include a portfolio tracker that can add and display stocks with their current prices.

Deadline: 10th August, 2024 at 10:00 am

# Solution

# Application Setup Instructions

**Important Note:** The current version of the application requires the specific Flutter SDK version specified in the `pubspec.yml` file. Ensure this version is installed in your emulator. If it's not, the application will default to running in a Chrome tab instead.

## Steps to Run the Application in Chrome

1. **Run the Application:**
   - Open your terminal or command prompt.
   - Navigate to the project directory.
   - Execute the following command:
     ```bash
     flutter run
     ```
   - If the Flutter SDK version in the emulator is incompatible, select the **Chrome** option when prompted. This will open the application in a Chrome browser tab.

2. **Access the Application:**
   - Once running, the application will be accessible through a specific local link, such as:
     ```
     http://localhost:xxxx
     ```
   - Replace `xxxx` with the port number provided by the terminal.

3. **Database Components:**
   - The application also uses a database. You can find the relevant SQL files in the repository, with the `.sql` extension.
   - Ensure you follow any database setup instructions provided in the repository to properly configure the application.

# Important Note:

1. **PostgreSQL Server Requirement:**
   - This application requires a PostgreSQL server configured with specific credentials. You will need to update the credentials in your environment as per your setup in VS Code.

2. **Example JSON Credentials:**
   Below is an example of the JSON file for the credentials as used in the application. These credentials will need to be modified based on your setup:

   ```json
   {
     "host": "localhost",
     "user": "postgres",
     "port": 5432,
     "ssl": false,
     "database": "portfolio",
     "password": "postgres"
   }

1. C:Realtime_Stock_Watchlist\backend\src\models\stock.ts
2. C:Realtime_Stock_Watchlist\backend\src\routes\stockRoutes.ts
3. C:Realtime_Stock_Watchlist\backend\src\index.ts

File Paths to Update:
You need to update the credentials in the following files:
C:\Realtime_Stock_Watchlist\backend\src\models\stock.ts
C:\Realtime_Stock_Watchlist\backend\src\routes\stockRoutes.ts
C:\Realtime_Stock_Watchlist\backend\src\index.ts

3. **Application Startup Order:**
   - The application may not run properly unless the following order is followed:
     1. **Run the backend** first.
     2. Then, **run the frontend** using the `flutter run` command in the respective folders.

4. **Database Configuration:**
   - The application might not be able to add stocks initially because it requires the URL of `localhost` obtained after running the backend server. Ensure the backend server is running so that the database is properly configured. The frontend will function correctly only after this step.

5. **SQL Operations:**
   - For further relational operations, please use SQL INT-TOOLS. You can remove the commands from comments as specified in the files with a `.sql` extension. Follow the same format for these files:
     1. C:\Realtime_Stock_Watchlist\StockWebApi.session.sql
     2. C:\Realtime_Stock_Watchlist\database\init.sql

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
   git clone https://github.com/pranjalsinha1965/Realtime_Stock_Watchlist.git
   cd realtime_stock_watchlist

### Running TypeScript Files from the Command Line

1. **Backend Setup**
Ensure that you have Node.js installed. If not, download and install it from Node.js official site.

2. **Install Dependencies**

Navigate to the backend directory and install the required packages:

```bash
cd realtime_stock_watchlist/backend
npm install
```

3. **Compile the TypeScript files:** 

```bash
npx tsc

```

# Final Steps for running the Mobile Web Application

1. **Relocate to the folder backend:**

``` bash
cd backend
```

2. **Run the backend:** 

``` bash
npx ts-node src/index.ts
```
3. **Relocate to the folder frontend:**

``` bash
flutter clean
flutter doctor
flutter run
```


