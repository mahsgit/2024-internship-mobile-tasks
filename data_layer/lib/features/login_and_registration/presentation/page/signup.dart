import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: BlocListener<SighUpBloc, UserBlocState>(
        listener: (context, state) {
          if (state is UserSuccess) {
            Navigator.pushNamed(context, '/');
          } else if (state is UserFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Signup failed. Please try again."),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            CustemText(
              labelText: 'Name',
              controller: namecontroller,
            ),
            SizedBox(height: 30),
            CustemText(
              labelText: 'Email',
              controller: emailcontroller,
            ),
            SizedBox(height: 30),
            CustemText(
              labelText: 'Password',
              controller: passwordcontroller,
            ),
            SizedBox(height: 30),
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
          ],
        ),
      ),
    );
  }
}
