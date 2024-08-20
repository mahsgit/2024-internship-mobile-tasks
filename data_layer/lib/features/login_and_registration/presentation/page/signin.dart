import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(
        title: Text('Sign In'),
      ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            CustemText(
              labelText: 'Email',
              controller: emailcontrollerin,
            ),
            SizedBox(height: 30),
            CustemText(
              labelText: 'Password',
              controller: passwordcontrollerin,
            ),
            SizedBox(height: 30),
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
             SizedBox(height: 30,),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: Text('You dont have an account? Sign up'),)
          ],
        ),
      ),
    );
  }
}
