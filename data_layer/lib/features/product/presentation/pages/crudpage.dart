import 'dart:io'; // For File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../widgets/customtextfield.dart';
import '../widgets/productmodel.dart';

class Crudpage extends StatefulWidget {
  const Crudpage({super.key});

  @override
  State<Crudpage> createState() => _CrudpageState();
}

class _CrudpageState extends State<Crudpage> {
  String _imagePath = '';
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _categorycontroller = TextEditingController();
  final TextEditingController _pricecontroller = TextEditingController();
  final TextEditingController _descriptioncontroller = TextEditingController();

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  void addProduct() {
    final String name = _namecontroller.text;
    final String category = _categorycontroller.text;
    final double price = double.parse(_pricecontroller.text);
    final String description = _descriptioncontroller.text;

    if (name.isNotEmpty && category.isNotEmpty) {
      final newProduct = Product(
        name: name,
        category: category,
        price: price,
        rating: 0.0,
        Image: File(_imagePath),
        description: description,
      );

      Provider.of<Productsofall>(context, listen: false).addproduct(newProduct);
      Navigator.pop(context);
    } else {
      Text("pleas fill the form");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 228, 228),
                borderRadius: BorderRadius.circular(24),
              ),
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Stack(
                children: [
                  _imagePath.isEmpty
                      ? Center(
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: Icon(Icons.image, size: 60),
                          ),
                        )
                      : GestureDetector(
                          onTap: _pickImage,
                          child: Image.file(
                            File(_imagePath),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name"),
                  CustomTextField(
                    width: 400,
                    height: 45,
                    controller: _namecontroller,
                  ),
                  SizedBox(height: 10),
                  Text("Category"),
                  CustomTextField(
                    width: 400,
                    height: 45,
                    controller: _categorycontroller,
                  ),
                  SizedBox(height: 10),
                  Text("Price"),
                  CustomTextField(
                    width: 400,
                    height: 45,
                    controller: _pricecontroller,
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '\$',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Description"),
                  CustomTextField(
                    width: 400,
                    height: 120,
                    controller: _descriptioncontroller,
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: addProduct,
                            child: Text("Apply",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              minimumSize: Size(350, 50),
                              backgroundColor: Color(0xFF3F51F3),
                            ),
                          ),
                          SizedBox(height: 20),
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: Size(350, 50),
                              side: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
