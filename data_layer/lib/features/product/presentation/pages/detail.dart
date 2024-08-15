import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/features/product/presentation/widgets/horizontalscrol.dart';

import '../../../../main.dart';
import '../bloc/addbloc/add_bloc.dart';
import '../bloc/addbloc/add_bloc_event.dart';
import '../bloc/addbloc/add_bloc_state.dart';
import 'crudpage.dart';

class Detail extends StatelessWidget {
  final String productId;
  final String productName;
  final String productCategory;
  final double productPrice;
  final double productRating;
  final String productImage;
  final String productDescription;

  const Detail({
    super.key,
    required this.productId,
    required this.productName,
    required this.productCategory,
    required this.productPrice,
    required this.productRating,
    required this.productImage,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(productImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20,
                        color: Color(0xFF3F51F3),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productCategory,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(
                        "(${productRating.toString()})",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("\$${productPrice.toStringAsFixed(2)}"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Size:",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            HorizontalScroll(count: 16),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                productDescription,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocConsumer<DeleteBloc, AddBlocState>(
                    listener: (context, state) {
                      if (state is SubmissionSuccess) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => RootApp()),
                        );
                      } else if (state is SubmissionFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Failed to delete")),
                        );
                      }
                    },
                    builder: (context, state) {
                      return OutlinedButton(
                        onPressed: () {
                          context
                              .read<DeleteBloc>()
                              .add(DeleteData(id: productId));
                        },
                        child: Text(
                          "Delete",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(150, 50),
                          side: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 60),
                  ElevatedButton(
                    onPressed: () {
                      {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Crudpage(
                              productId: productId,
                              productName: productName,
                              productCategory: productCategory,
                              productPrice: productPrice,
                              productRating: productRating,
                              productImage: productImage,
                              productDescription: productDescription,
                            ),
                          ),
                        );
                      }
                      ;
                    },
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(150, 50),
                      backgroundColor: Color(0xFF3F51F3),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
