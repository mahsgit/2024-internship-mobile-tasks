import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/signup');
      },
      child: Scaffold(
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
            )),
            Positioned(
              left: 0,
              right: 0,
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
                            // textAlign: TextAlign.center,
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
                    Text(
                      "ECOMMERCE APP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                        wordSpacing: 8,
                        letterSpacing: 4,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
