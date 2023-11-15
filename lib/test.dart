import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListScreen(),
    );
  }
}

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Fanta Jeruk',
      description: 'Description for Product 1',
      price: 10,
      imageUrl:
          'https://images.tokopedia.net/img/cache/700/hDjmkQ/2022/12/6/d3b1c185-d9c0-4607-b18c-f7a8062ac641.jpg',
    ),
    Product(
      id: '2',
      name: 'Coca-Cola',
      description: 'Description for Product 2',
      price: 12.5,
      imageUrl:
          'https://images.tokopedia.net/img/cache/700/hDjmkQ/2022/12/6/d3b1c185-d9c0-4607-b18c-f7a8062ac641.jpg',
    ),
    Product(
      id: '3',
      name: 'Sprite',
      description: 'Description for Product 3',
      price: 11.8,
      imageUrl:
          'https://images.tokopedia.net/img/cache/700/hDjmkQ/2022/12/6/d3b1c185-d9c0-4607-b18c-f7a8062ac641.jpg',
    ),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Godrej'),
        backgroundColor: Colors.red, // Warna merah pada app bar
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implement back button functionality
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: () {
              // Implement inbox functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.red, // Warna merah pada foto toko
              backgroundImage: AssetImage(
                  'assets/store_image.jpg'), // Ganti dengan path gambar toko
            ),
          ),
          const Text(
            'Nama Toko',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Jumlah Pengikut: 1000', // Ganti dengan jumlah pengikut yang sesuai
          ),
          ElevatedButton(
            onPressed: () {
              // Implement fungsi tombol mengikuti
            },
            child: Text('Mengikuti'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].name),
                  subtitle: Text('${products[index].price.toStringAsFixed(3)}'),
                  leading: CachedNetworkImage(
                    imageUrl: products[index].imageUrl,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Implement fungsi tombol masukkan dalam keranjang
                    },
                    child: Text('Masukkan dalam keranjang'),
                  ),
                  onTap: () {
                    // Implement navigasi ke halaman detail produk
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
