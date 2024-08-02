import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:task6/customtextfield.dart';
import 'package:task6/productmodel.dart';

class Crudpage extends StatefulWidget {
  const Crudpage({super.key});

  @override
  State<Crudpage> createState() => _CrudpageState();
}

class _CrudpageState extends State<Crudpage> {
  String _name = '';
  String _Category = '';
  double _price = 0.0;
  String _description = '';

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _categorycontroller = TextEditingController();
  final TextEditingController _pricecontroller = TextEditingController();
  final TextEditingController _descriptioncontroller = TextEditingController();

  void addproduct() {
    setState(() {
      productList.add(Product(
          name: _namecontroller.text,
          price: double.parse(_pricecontroller.text),
          category: _categorycontroller.text,
          image: "images/image.png",
          rating: 0.0));
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(
          title: Text("Add Product"),
        )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 228, 228),
                      borderRadius: BorderRadius.circular(24)),
                  width: double.maxFinite,
                  height: 200,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 60),
                      SizedBox(
                        height: 10,
                      ),
                      Text("upload image")
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Name"),
                      CustomTextField(
                        fillColor: const Color.fromARGB(255, 225, 225, 225),
                        width: 400,
                        height: 40,
                        controller: _namecontroller,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text("Category"),
                      CustomTextField(
                        fillColor: const Color.fromARGB(255, 225, 225, 225),
                        width: 400,
                        height: 40,
                        controller: _categorycontroller,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text("price"),
                      CustomTextField(
                        fillColor: const Color.fromARGB(255, 225, 225, 225),
                        width: 400,
                        height: 40,
                        controller: _pricecontroller,
                        suffixIcon: Icon(Icons.attach_money),
                      ),
                      const Text("Description"),
                      CustomTextField(
                        fillColor: const Color.fromARGB(255, 225, 225, 225),
                        width: 400,
                        height: 40,
                        controller: _descriptioncontroller,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              ElevatedButton(
                                  onPressed: () {
                                    addproduct();
                                    //  Navigator.pushNamed(context, '/');
                                  },
                                  child: Text("Apply",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      minimumSize: Size(300, 50),
                                      backgroundColor:
                                          Color.fromARGB(255, 0, 140, 255))),
                              SizedBox(
                                height: 20,
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/');
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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  minimumSize: Size(300, 50),
                                  side: BorderSide(
                                    color: Colors.red, // Border color
                                    width: 2, // Border width
                                  ),
                                ),
                              )
                            ])
                          ])
                    ],
                  )))
            ],
          ),
        ));
  }
}
