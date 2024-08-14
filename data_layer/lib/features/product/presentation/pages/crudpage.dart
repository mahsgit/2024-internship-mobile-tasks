import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../bloc/addbloc/add_bloc.dart';
import '../bloc/addbloc/add_bloc_event.dart';
import '../bloc/addbloc/add_bloc_state.dart';
import '../widgets/customtextfield.dart';
import '../widgets/productmodel.dart';

class Crudpage extends StatefulWidget {
  final String? productId;
  final String? productName;
  final String? productCategory;
  final double? productPrice;
  final double? productRating;
  final String? productImage;
  final String? productDescription;

  const Crudpage({
    super.key,
    this.productId,
    this.productName,
    this.productCategory,
    this.productPrice,
    this.productRating,
    this.productImage,
    this.productDescription,
  });

  // const Crudpage({super.key});

  @override
  State<Crudpage> createState() => _CrudpageState();
}

class _CrudpageState extends State<Crudpage> {
  File? _Image;
  String _imagePath = ' ';
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _categorycontroller = TextEditingController();
  final TextEditingController _pricecontroller = TextEditingController();
  final TextEditingController _descriptioncontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.productId != null) {
      _namecontroller.text = widget.productName ?? 'uu';
      _categorycontroller.text = widget.productCategory ?? 'uu';
      _pricecontroller.text = widget.productPrice?.toString() ?? '';
      _descriptioncontroller.text = widget.productDescription ?? '';
      _imagePath = widget.productImage ?? '';
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedimage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      setState(() {
        _Image = File(pickedimage.path);

        _imagePath = pickedimage.path;
      });
    }
  }

  void _saveProduct() {
    final String name = _namecontroller.text;
    final String category = _categorycontroller.text;
    final double price = double.parse(_pricecontroller.text);
    final String description = _descriptioncontroller.text;

    if (name.isNotEmpty &&
        category.isNotEmpty &&
        (_Image != null || widget.productImage != null)) {
      final String imagepath =
          _Image != null ? _Image!.path : widget.productImage!;

      if (widget.productId != null) {
        context.read<UpdateBloc>().add(AddData(
            id: widget.productId!,
            name: name,
            category: category,
            price: price,
            description: description,
            imagePath: imagepath));
      } else {
        context.read<AddBloc>().add(AddData(
            id: Uuid().v4(),
            name: name,
            category: category,
            price: price,
            description: description,
            imagePath: imagepath));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("please fill all the fieldsss"),
      ));
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text(widget.productId != null ? "Update Product" : "Add Product"),
        ),
        body: BlocListener<AddBloc, AddBlocState>(
          listener: (context, state) {
            if (state is SubmissionSuccess) {
              print("successssssss");
              Navigator.pop(context);
            } else if (state is SubmissionFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: SingleChildScrollView(
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
                      if (widget.productId == null)
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
                              )
                      else
                        Image.network(
                          widget.productImage!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        )
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
                                onPressed: _saveProduct,
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
        ));
  }
}
