import 'package:flutter/material.dart';
import 'package:tugas_7/cart_model.dart';
import 'package:tugas_7/cart_page.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final products = [
    Product('Keyboard', 'Perangkat untuk Mengetik'),
    Product('Mouse', 'Perangkat untuk Menggerakkan Pointer'),
    Product('Monitor', 'Perangkat untuk Menampilkan Gambar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toko Elektronik'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Consumer<CartModel>(
              builder: (context, cart, child) {
                return Badge(
                  label: Text('${cart.totalItems}'),
                  isLabelVisible: cart.totalItems > 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.shopping_bag, color: Colors.white),
              ),
              title: Text(product.nama),
              subtitle: Text(product.deskripsi),
              trailing: IconButton(
                onPressed: () {
                  Provider.of<CartModel>(context, listen: false).add(product);
                },
                icon: Icon(Icons.add_shopping_cart),
              ),
            ),
          );
        },
      ),
    );
  }
}