import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_gallery/authentication/CreateAccout.dart';
import 'package:go_gallery/authentication/Login.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(screenWidth * 0.15,
                    screenWidth * 0.15, screenWidth * 0.15, 32),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      height: screenHeight * 0.32,
                      "images/undraw_navigator_a479.svg",
                    ),
                    const SizedBox(height: 32),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, 
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: 'Make your ',
                          ),
                          TextSpan(
                            text: 'Roadtrips ',
                            style: TextStyle(
                                color: Color.fromRGBO(236, 183, 102, 1)),
                          ),
                          TextSpan(
                            text: 'More ',
                          ),
                          TextSpan(
                            text: 'Dynamic',
                            style: TextStyle(
                                color: Color.fromRGBO(236, 183, 102, 1)),
                          ),
                          // TextSpan(
                          //   text: ' & ',
                          // ),
                          // TextSpan(
                          //   text: 'Memorable',
                          //   style: TextStyle(
                          //       color: Color.fromRGBO(236, 183, 102, 1)),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      " Whether you’re dreaming of coastal drives, mountain escapes, or the best foodie stops across the country, Roadtrip Router is here to make your journey unforgettable.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF757575),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * 0.90,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateAccount()));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromRGBO(255, 191, 99, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: screenWidth * 0.90,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: Color.fromRGBO(255, 191, 99, 1),
                              style: BorderStyle.solid,
                              width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(255, 191, 99, 1)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18,),
              // Center(
              //     child: RichText(
              //       text: TextSpan(children: [
              //         TextSpan(
              //           text: "Continue without an account",
              //           style: GoogleFonts.aBeeZee(color: Colors.grey[700], fontSize: 17),
              //           recognizer: TapGestureRecognizer()
              //             ..onTap = () {
              //               // Anon Sign in.
              //             }
              //         ),
                      
              //       ]),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
