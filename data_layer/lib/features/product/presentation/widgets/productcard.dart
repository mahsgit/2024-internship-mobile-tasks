import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task6/features/product/presentation/pages/detail.dart';

import '../../domain/entities/product.dart';





  final  File defaultimage=File('images/image.png');
class ProductCard extends StatelessWidget {
  
  final List<Product> products;

   ProductCard({super.key, required this.products});

  List<Widget> _buildCard(BuildContext context) {
    return products.map((product) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => Detail(
                productName: product.name,
                productCategory: product.category,
                productPrice: product.price,
                productRating: product.rating,
                productImage: product.imageUrl,
                // productImagefile: product.Image,
                productDescription: product.description,
              ),
            ),
          );
        },
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                  Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.infinity,
                    ),
                
              // product.Image != null
              //     ? Image.file(
              //         product.Image!,
              //         fit: BoxFit.cover,
              //         height: 150,
              //         width: double.infinity,
              //       )
              //     : Image.asset(
              //         product.image,
              //         fit: BoxFit.cover,
              //         height: 150,
              //         width: double.infinity,
              //       ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text("\$${product.price.toStringAsFixed(2)}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.category,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow),
                            Text(
                              "(${product.rating.toString()})",
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: 10 / 7,
      padding: EdgeInsets.symmetric(vertical: 8),
      children: _buildCard(context),
    );
  }
}
