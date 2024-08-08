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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Product"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 300,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12.0),
                              filled: false,
                              hintText: "Leather"),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF3F51F3)),
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return bottomfilter();
                                      });
                                },
                                child: Icon(
                                  Icons.filter_list,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ))),
                    ],
                  ),
                  Expanded(
                    child: ProductCard(products: Productsofall.productList),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class bottomfilter extends StatefulWidget {
  const bottomfilter({super.key});

  @override
  State<bottomfilter> createState() => _bottomfilterState();
}

class _bottomfilterState extends State<bottomfilter> {
  double _minpriceValue = 0;
  double _maxpriceValue = 500;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Category",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              width: 300,
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  filled: false,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("Price "),
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
              activeColor: Color(0xFF3F51F3),
              inactiveColor: Colors.grey,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text(
                    "Apply",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(300, 50),
                    backgroundColor: Color(0xFF3F51F3),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
