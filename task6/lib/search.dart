import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task6/customtextfield.dart';
import 'package:task6/productcard.dart';
import 'package:task6/productmodel.dart';
import 'horizontalscrol.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  double _minpriceValue = 0;
  double _maxpriceValue = 500;

  // Default value for the price slider
  RangeValues _values = RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_ios_new_rounded,color: const Color.fromARGB(255, 0, 133, 243),),
        title: Text("Search Product"),
      ),
      body: Column(
        children: [
          // Top section with search field and product cards
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Leather",
                          suffixIcon: Icon(
                            Icons.arrow_forward,
                            color: Color.fromARGB(255, 0, 140, 255),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 0, 140, 255)),
                            child: Icon(
                              Icons.filter_list,
                              color: Colors.white,
                              size: 30,
                            ),
                          )),
                    ],
                  ),
                  Expanded(
                    child: ProductCard(products: productList),
                  ),
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category "),
                  CustomTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("price"),
                        RangeSlider(
                          values: RangeValues(_minpriceValue, _maxpriceValue),
                          min: 0,
                          max: 500,
                          divisions: 10,
                          onChanged: (value) {
                            setState(() {
                              _minpriceValue = value.start;
                              _maxpriceValue = value.end;
                            });
                          },
                          activeColor: Colors.blue,
                          inactiveColor: Colors.grey,
                        )
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                             Navigator.pushNamed(context, '/');
                          },
                          child: Text("Apply",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              minimumSize: Size(300, 50),
                              backgroundColor:
                                  Color.fromARGB(255, 0, 140, 255)))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
