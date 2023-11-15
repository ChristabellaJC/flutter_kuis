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
          'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/2/26/c56bd5f1-c57e-4a90-b8b3-62c5894a76e7.jpg',
    ),
    Product(
      id: '3',
      name: 'Sprite',
      description: 'Sprite',
      price: 11.8,
      imageUrl:
          'https://images.tokopedia.net/img/cache/700/VqbcmM/2023/5/10/9eb5bbfe-f5cf-4612-a8de-646f06e88c07.jpg',
    ),
    Product(
      id: '4',
      name: 'RootBeer',
      description: 'RB',
      price: 17.9,
      imageUrl:
          'https://images.tokopedia.net/img/cache/700/VqbcmM/2023/8/19/a6b35b6e-bf83-4756-8270-65f95a60d635.jpg',
    ),
    Product(
      id: '5',
      name: 'Milkis',
      description: 'Milkis',
      price: 6.9,
      imageUrl:
          'https://images.tokopedia.net/img/cache/700/product-1/2021/3/30/11023039/11023039_e5124815-68a3-4f1d-9f0b-43aeecb9b613.jpeg',
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
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: () {},
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
                backgroundImage: AssetImage(
                    'https://www.its.ac.id/it/wp-content/uploads/sites/46/2021/06/blank-profile-picture-973460_1280.png'),
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
              onPressed: () {},
              child: Text('Mengikuti'),
            ),
            const SizedBox(height: 16.0),
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
            const SizedBox(height: 16.0),
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
                    onPressed: () {},
                    child: Text('Masukkan dalam keranjang'),
                  ),
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
