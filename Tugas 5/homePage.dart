
import 'package:flutter/material.dart';
import 'package:tugas_5/detailPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> foods = [
      {
        'nama': 'Nasi Goreng Spesial',
        'harga': 25000,
        'deskripsi': 'Nasi goreng spesial dengan telur, ayam, sosis, dan bumbu rempah pilihan yang lezat.',
        'gambar': 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=600'
      },
      {
        'nama': 'Burger Beef',
        'harga': 35000,
        'deskripsi': 'Burger dengan daging sapi juicy, keju, sayuran segar, dan saus spesial.',
        'gambar': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600'
      },
      {
        'nama': 'Pizza Pepperoni',
        'harga': 85000,
        'deskripsi': 'Pizza dengan topping pepperoni, keju mozzarella, dan saus tomat khas Italia.',
        'gambar': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=600'
      },
      {
        'nama': 'Mie Ayam Bakso',
        'harga': 20000,
        'deskripsi': 'Mie kenyal dengan potongan ayam berbumbu, bakso sapi, dan kuah kaldu gurih.',
        'gambar': 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=600'
      },
      {
        'nama': 'Ayam Bakar',
        'harga': 30000,
        'deskripsi': 'Ayam bakar dengan bumbu kecap meresap, disajikan dengan sambal dan lalapan.',
        'gambar': 'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=600'
      },
      {
        'nama': 'Pancake Strawberry',
        'harga': 28000,
        'deskripsi': 'Pancake lembut dengan topping strawberry segar dan sirup manis.',
        'gambar': 'https://images.unsplash.com/photo-1528207776546-365bb710ee93?w=600'
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: const Text(
          'Food Menu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.restaurant_menu),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Temukan makanan favoritmu hari ini.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Daftar Makanan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];

                return Card(
                  color: Colors.white,
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        food['gambar'],
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 90,
                            height: 90,
                            color: Colors.orange.shade100,
                            child: const Icon(Icons.fastfood),
                          );
                        },
                      ),
                    ),
                    title: Text(
                      food['nama'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Rp ${food['harga'].toString()}',
                        style: const TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.deepOrange,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            nama: food['nama'],
                            harga: food['harga'],
                            deskripsi: food['deskripsi'],
                            gambar: food['gambar'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
