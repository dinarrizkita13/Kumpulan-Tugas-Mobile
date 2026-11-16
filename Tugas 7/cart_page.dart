
import 'package:flutter/material.dart';
import 'package:tugas_7/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Anda'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(child: Text('Keranjang Kosong'));
          }

          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final product = cart.items[index];

              return Card(
                margin: EdgeInsets.all(5),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(product.nama),
                  subtitle: Text(product.deskripsi),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Hapus'),
                    onPressed: () {
                      cart.removeItem(product);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
