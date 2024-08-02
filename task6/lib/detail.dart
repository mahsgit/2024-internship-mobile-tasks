import 'package:flutter/material.dart';
import 'package:task6/search.dart';
import 'horizontalscrol.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            // Wrap with SingleChildScrollView to handle overflow
            child: Column(children: [
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/image.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
      const Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Men's shoe",
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Text(
                    "(4.0)",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          )),
      SizedBox(height: 5),
      const Padding(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Derby Leather",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("\$120")
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "size",
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
      HorizontalScroll(count: 16),
      Padding(
        padding: EdgeInsets.all(20),
        child: Text(
            "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe."),
      ),
      Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                minimumSize: Size(150, 50),
                side: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
            ),
            SizedBox(
              width: 60,
            ),
            ElevatedButton(
                onPressed: () {
                   Navigator.pushNamed(context, '/');
                },
                child: Text("Update",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    minimumSize: Size(150, 50),
                    backgroundColor: Color.fromARGB(255, 0, 140, 255))),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ])));
  }
}
