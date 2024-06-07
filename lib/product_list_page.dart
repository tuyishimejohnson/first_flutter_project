import 'package:flutter/material.dart';
import 'product.dart';
import 'product_detail_page.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Pixel 1', description: 'Pixel is the most featureful phone ever', price: 800),
    Product(name: 'Laptop', description: 'Laptop is the most productive development tool', price: 2000),
    Product(name: 'Tablet', description: 'Tablet is the most useful device ever for meeting', price: 1500),
    Product(name: 'Pendrive', description: 'Pendrive is the most convenient storage device', price: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Product Navigation',style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          Color productColor;
          switch (index) {
            case 0:
              productColor = Colors.blue;
              break;
            case 1:
              productColor = Colors.green;
              break;
            case 2:
              productColor = Colors.purple;
              break;
            case 3:
              productColor = Colors.red;
              break;
            default:
              productColor = Colors.transparent;
          }

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product, color: productColor),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Container(
                    color: productColor,
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    child: Text(
                      product.name,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.description),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Price: \$${product.price}'),
                              Row(
                                children: List.generate(4, (i) => const Icon(Icons.star, color: Colors.orange)), // 4 orange stars
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
