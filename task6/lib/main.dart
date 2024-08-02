import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task6/crudpage.dart';
import 'package:task6/popups.dart';
import 'package:task6/productcard.dart';
import 'package:task6/productmodel.dart';
import 'package:task6/search.dart';
import 'detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> productList = Product.defaultProducts;
    return  MaterialApp(
      debugShowCheckedModeBanner: false, 
      initialRoute: '/',
      routes: {
        '/':(context)=> const RootApp(),
        '/search':(context)=> Search(),
        '/detail':(context)=>Detail(),
        '/crudepage':(context)=>Crudpage()
        
      }
        );
  }
}

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(3),
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 210, 208, 208),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "July 14, 2023",
              style: TextStyle(
                fontSize: 10,
                color: Color.fromARGB(255, 143, 142, 142),
              ),
            ),
            Text(
              "Hello, Yohannes",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              showPopup(context);

            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(2, 15, 2, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Available Products",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Search()),
                      );
                    },
                    child: Icon(Icons.search),
                  )
                ]),
          ),
          Expanded(
            child: ProductCard(products: productList),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(side: BorderSide.none, eccentricity: 1),
        onPressed: () {
          Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => Crudpage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return RotationTransition(
                turns: animation,
                child: child,
              );
            },
          ));
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 44,
        ),
      ),
    );
  }
}
