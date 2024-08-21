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
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();
  bool isprivacychecked = false;

  void terms() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Terms & Policy"),
          content: Text("Just accept it man"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("I dont have a choice "),
            ),
          ],
        );
      },
    );
  }

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
    if (passwordcontroller.text != confirmpasswordcontroller.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password does not match'),
        backgroundColor: Colors.red,
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
                    color: Color.fromRGBO(63, 81, 243, 1),
                  ),
                  SizedBox(
                    width: 220,
                  ),
                  Container(
                    width: 70,
                    height: 30,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("ECOM",
                            style: GoogleFonts.caveatBrush(
                              textStyle: TextStyle(
                                color: Color.fromRGBO(63, 81, 243, 1),
                                fontWeight: FontWeight.w900,
                                shadows: [
                                  Shadow(
                                    blurRadius: 2.0,
                                    color: Color.fromRGBO(63, 81, 243, 1),
                                    offset: Offset(3.0, 3.0),
                                  ),
                                ],
                                fontSize: 60,
                              ),
                            )),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromRGBO(63, 81, 243, 1)),
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 57, 57, 57).withOpacity(0.50),
                          spreadRadius: 1,
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
              padding: const EdgeInsets.fromLTRB(38, 10, 38, 25),
              child: Column(
                children: [
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      CustemText(
                        obscureText: false,
                        labelText: 'Name',
                        controller: namecontroller,
                      ),
                      SizedBox(height: 8),
                      CustemText(
                        obscureText: false,
                        labelText: 'Email',
                        controller: emailcontroller,
                      ),
                      SizedBox(height: 8),
                      CustemText(
                        obscureText: true,
                        labelText: 'Password',
                        controller: passwordcontroller,
                      ),
                      SizedBox(height: 8),
                      CustemText(
                        obscureText: true,
                        labelText: 'Confirm password',
                        controller: confirmpasswordcontroller,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Checkbox(
                            value: isprivacychecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isprivacychecked = value!;
                              });
                            },
                            activeColor: Color.fromRGBO(63, 81, 243, 1),
                          ),
                          Row(
                            children: [
                              Text("I understood the"),
                              TextButton(
                                  onPressed: terms,
                                  child: Text(
                                    "terms & policy.",
                                    style: TextStyle(
                                      color: Color.fromRGBO(63, 81, 243, 1),
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => senddata(context),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          minimumSize: Size(350, 50),
                          backgroundColor: Color.fromRGBO(63, 81, 243, 1),
                        ),
                      ),
                      SizedBox(
                        height: 95,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account?',
                            style: TextStyle(
                              color: Color.fromARGB(255, 142, 142, 142),
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/signin'),
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                color: Color.fromRGBO(63, 81, 243, 1),
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
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
