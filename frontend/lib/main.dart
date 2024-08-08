import 'package:flutter/material.dart';
import 'pages/add_stock.dart';
import 'pages/stock_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real-Time Stock Watchlist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add_stock': (context) => AddStockPage(),
        '/stock_list': (context) => StockListPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Watchlist Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_stock');
              },
              child: Text('Add Stock'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stock_list');
              },
              child: Text('View Stock List'),
            ),
          ],
        ),
      ),
    );
  }
}
