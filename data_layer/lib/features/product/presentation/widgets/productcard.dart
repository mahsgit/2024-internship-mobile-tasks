import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task6/features/product/presentation/pages/detail.dart';

import '../../domain/entities/product.dart';





class ProductCard extends StatelessWidget {
  
  final List<Product> products;

   ProductCard({super.key, required this.products});

  List<Widget> _buildCard(BuildContext context) {
    return products.map((product) {
      // for each product make the gustured wrapped widget
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => Detail(productdetail:product ),
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

                        //change it to 2 decimal degit 25.00
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

      
    }).toList();// it return list of widgets
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // one item per row so 1 column
      crossAxisCount: 1,
      childAspectRatio: 10 / 7,
      padding: EdgeInsets.symmetric(vertical: 8),
      // call the list or product we build in _buildCard method
      children: _buildCard(context),
    );
  }
}
