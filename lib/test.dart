import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
      description: 'Fanta rasa Jeruk',
      price: 10,
      imageUrl:
          'https://images.tokopedia.net/img/cache/700/hDjmkQ/2022/12/6/d3b1c185-d9c0-4607-b18c-f7a8062ac641.jpg',
    ),
    Product(
      id: '2',
      name: 'Coca-Cola',
      description: 'Coca Cola',
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

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Godrej'),
        backgroundColor: Colors.red, 
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {

          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: () {

            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red, 
                backgroundImage: AssetImage(
                    'assets/store_image.jpg'), 
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
              'Jumlah Pengikut: 1000', 
            ),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Mengikuti'),
            ),
            const SizedBox(
                height: 16.0),
            CarouselSlider(
              items: [
                Image.network(
                    'https://s3.bukalapak.com/uploads/attachment/830801/kupon_bukalapak_diskon.jpg')
              ],
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),

            const SizedBox(
                height:
                    16.0), 
            CarouselSlider(
              items: [
                Image.network(
                    'https://s0.bukalapak.com/athena/microsite-lite/original/3045e220-eb7e-fbc0-d4c9-66d3551fca5e.webp.webp')
              ],
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
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
                    },
                    child: Text('Masukkan dalam keranjang'),
                  ),
                  onTap: () {
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
