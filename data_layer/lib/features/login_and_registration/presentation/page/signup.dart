import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../product/presentation/pages/home.dart';
import '../bloc/user+bloc.dart';
import '../bloc/user_bloc_event.dart';
import '../bloc/user_bloc_state.dart';
import '../widget/textfield.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  Future<void> senddata(BuildContext context) async {
    final name = namecontroller.text;
    final email = emailcontroller.text;
    final password = passwordcontroller.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      context.read<SighUpBloc>().add(Signupevent(
            name: name,
            email: email,
            password: password,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SighUpBloc, UserBlocState>(
      listener: (context, state) {
        if (state is UserSuccess) {
          Navigator.pushNamed(context, "/signin");
        } else if (state is UserFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Signup failed. Please try again."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 10, 30),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 220,
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    child: Center(
                      child: Text("ECOM",
                          style: GoogleFonts.caveatBrush(
                            textStyle: TextStyle(
                              color: Color.fromRGBO(63, 81, 243, 1),
                              fontWeight: FontWeight.w900,
                              fontSize: 26,
                            ),
                          )),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue),
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 57, 57, 57).withOpacity(0.50),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: Column(
                children: [
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      CustemText(
                        labelText: 'Name',
                        controller: namecontroller,
                      ),
                      SizedBox(height: 10),
                      CustemText(
                        labelText: 'Email',
                        controller: emailcontroller,
                      ),
                      SizedBox(height: 10),
                      CustemText(
                        labelText: 'Password',
                        controller: passwordcontroller,
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () => senddata(context),
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          minimumSize: Size(350, 50),
                          backgroundColor: Color(0xFF3F51F3),
                        ),
                      ),
                      SizedBox(
                        height: 95,
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/signin'),
                        child: Text('Already have an account? Sign in'),
                      )
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
