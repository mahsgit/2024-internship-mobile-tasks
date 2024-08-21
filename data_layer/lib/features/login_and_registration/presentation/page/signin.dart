import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../product/presentation/pages/home.dart';
import '../bloc/user+bloc.dart';
import '../bloc/user_bloc_event.dart';
import '../bloc/user_bloc_state.dart';
import '../widget/textfield.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController emailcontrollerin = TextEditingController();
  final TextEditingController passwordcontrollerin = TextEditingController();

  void signinfunc(BuildContext context) async {
    final email = emailcontrollerin.text;
    final password = passwordcontrollerin.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      context.read<SignInBloc>().add(Signinevent(
            email: email,
            password: password,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SignInBloc, UserBlocState>(
      listener: (context, state) {
        if (state is UserSuccesslogin) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RootApp(),
            ),
          );
        } else if (state is UserFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Sign In failed. Please try again."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 110,
          ),
          Container(
            width: 160,
            height: 80,
            child: Center(
              child: Text("ECOM",
                  style: GoogleFonts.caveatBrush(
                    textStyle: TextStyle(
                      color: Color.fromRGBO(63, 81, 243, 1),
                      fontWeight: FontWeight.w900,
                      fontSize: 50,
                    ),
                  )),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue),
              color: Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 57, 57, 57).withOpacity(0.50),
                  spreadRadius: 4,
                  blurRadius: 9,
                  offset: Offset(0, 5),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      "Sign into your account",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    CustemText(
                      labelText: 'Email',
                      controller: emailcontrollerin,
                    ),
                    SizedBox(height: 10),
                    CustemText(
                      labelText: 'Password',
                      controller: passwordcontrollerin,
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () => signinfunc(context),
                      child: Text(
                        "Sign In",
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
                      height: 100,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/signup'),
                      child: Text('You dont have an account? Sign up'),
                    )
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    ));
  }
}
