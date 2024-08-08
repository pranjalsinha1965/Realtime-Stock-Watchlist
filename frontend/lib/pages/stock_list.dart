import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StockListPage extends StatefulWidget {
  @override
  _StockListPageState createState() => _StockListPageState();
}

class _StockListPageState extends State<StockListPage> {
  late Future<List<dynamic>> _stocks;

  Future<List<dynamic>> _fetchStocks() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:3001/stocks')); // Replace <your-host-ip> with actual IP

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load stocks');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _stocks = _fetchStocks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _stocks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No stocks available'));
          } else {
            final stocks = snapshot.data!;

            return ListView.builder(
              itemCount: stocks.length,
              itemBuilder: (context, index) {
                final stock = stocks[index];
                return ListTile(
                  title: Text(stock['name']),
                  subtitle: Text(stock['symbol']),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
