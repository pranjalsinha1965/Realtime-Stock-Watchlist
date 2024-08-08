import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddStockPage extends StatefulWidget {
  @override
  _AddStockPageState createState() => _AddStockPageState();
}

class _AddStockPageState extends State<AddStockPage> {
  final _formKey = GlobalKey<FormState>();
  final _stockNameController = TextEditingController();
  final _stockSymbolController = TextEditingController();
  bool _isLoading = false;

  Future<void> _addStock() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final response = await http.post(
          Uri.parse('http://127.0.0.1:3001/stocks'), // Replace <your-host-ip> with actual IP
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'name': _stockNameController.text,
            'symbol': _stockSymbolController.text,
          }),
        );

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Stock added successfully!')),
          );
          _stockNameController.clear();
          _stockSymbolController.clear();
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add stock: ${response.reasonPhrase}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _stockNameController.dispose();
    _stockSymbolController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Stock'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _stockNameController,
                decoration: InputDecoration(labelText: 'Stock Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a stock name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _stockSymbolController,
                decoration: InputDecoration(labelText: 'Stock Symbol'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a stock symbol';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _addStock,
                child: Text('Add Stock'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
