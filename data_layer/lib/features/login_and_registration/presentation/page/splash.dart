import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _startAnimation = false;
  bool _reverseAnimation = false;

  @override
  void initState() {
    super.initState();
    _animateText();
  }

  void _animateText() async {
    setState(() {
      _startAnimation = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _reverseAnimation = true;
    });

    await Future.delayed(Duration(seconds: 1));

    Navigator.pushReplacementNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/image.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.centerRight,
                    colors: [
                      const Color.fromRGBO(63, 81, 243, 1).withOpacity(0.95),
                      const Color.fromRGBO(63, 81, 243, 1).withOpacity(0.7)
                    ]),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            left: _startAnimation
                ? (_reverseAnimation ? -300 : 20)
                : -300, 
            right: 20,
            top: 280,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 100,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ECOM",
                          style: GoogleFonts.caveatBrush(
                              textStyle: TextStyle(
                            color: Color.fromRGBO(63, 81, 243, 1),
                            fontSize: 50,
                          )),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    left: _reverseAnimation
                        ? 20
                        : -300, 
                    right: _startAnimation
                        ? (_reverseAnimation ? -300 : 20)
                        : -300, 
                    child: Text(
                      "ECOMMERCE APP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                        wordSpacing: 8,
                        letterSpacing: 4,
                      ),
                    ),
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
