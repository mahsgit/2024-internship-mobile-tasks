import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/features/product/presentation/widgets/horizontalscrol.dart';

import '../../../../main.dart';
import '../../domain/entities/product.dart';
import '../bloc/addbloc/add_bloc.dart';
import '../bloc/addbloc/add_bloc_event.dart';
import '../bloc/addbloc/add_bloc_state.dart';
import 'crudpage.dart';

class Detail extends StatelessWidget {
  final Product productdetail;

   const Detail({ super.key ,required this.productdetail});

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
                        image: NetworkImage(productdetail.imageUrl),
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
                      icon: const Icon(
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
                    productdetail.category,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(
                        "(${productdetail.rating.toString()})",
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
                    productdetail.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("\$${productdetail.price.toStringAsFixed(2)}"),
                ],
              ),
            ),
            SizedBox(height: 10),
           const  Padding(
              padding:  EdgeInsets.fromLTRB(30, 0, 30, 5),
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
                productdetail.description,
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
ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("success fully deleted")),
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
                              .add(DeleteData(id: productdetail.id));
                        Navigator.pushNamed(context, '/');

                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(150, 50),
                          side: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
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
                            builder: (context) => Crudpage(productcrud:productdetail),
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
