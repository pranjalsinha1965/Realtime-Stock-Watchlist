import 'package:flutter/material.dart';
import 'pages/add_stock.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real-Time Stock Watchlist',
      theme: ThemeData(
        primaryColor: Color(0xFF00D09C), // Groww's green shade
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF2962FF), // Groww's blue shade
        ),
        fontFamily: 'Roboto',
        brightness: Brightness.light,
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
        title: Row(
          children: [
            Image.asset(
              'assets/logo.jpg', // Path to your logo asset
              height: 40,
            ),
            SizedBox(width: 10),
            Text('Stock Watchlist Home'),
          ],
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        color: Colors.white, // Background color for the body
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/add_stock');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor, // Button color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Add Stock',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16), // Space between buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/stock_list');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary, // Button color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'View Stock List',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Stock',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Stock List',
          ),
        ],
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/add_stock');
              break;
            case 2:
              Navigator.pushNamed(context, '/stock_list');
              break;
          }
        },
      ),
    );
  }
}

class StockListPage extends StatefulWidget {
  @override
  _StockListPageState createState() => _StockListPageState();
}

class _StockListPageState extends State<StockListPage> {
  Future<List<dynamic>> _fetchStocks() async {
    final response = await http.get(Uri.parse('http://localhost:3001/stocks'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load stocks');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock List'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _fetchStocks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No stocks available.'));
          } else {
            final stocks = snapshot.data!;
            return ListView.builder(
              itemCount: stocks.length,
              itemBuilder: (context, index) {
                final stock = stocks[index];
                return ListTile(
                  title: Text(stock['name']),
                  subtitle: Text('Price: ${stock['price']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
