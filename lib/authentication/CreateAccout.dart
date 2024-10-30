import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_gallery/authentication/auth.dart';
import 'package:go_gallery/components/EmailTextField.dart';
import 'package:go_gallery/components/GoogleSignInButton.dart';
import 'package:go_gallery/components/NameTextField.dart';
import 'package:go_gallery/components/PasswordTextField.dart';
import 'package:go_gallery/traveler_screens/TravelerHome.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  TextEditingController _nameEditingController = TextEditingController();

  String errorText = ""; 
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create your Account",
                  style: GoogleFonts.dmSans(
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Default color
                    ),
                  ),
                ),
                Text(
                  "Begin an immersive roadtrip experience",
                  style: GoogleFonts.dmSans(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF757575), // Default color
                    ),
                  ),
                ),
                SizedBox(height: 24),
                NameTextField(inputController: _nameEditingController),
                SizedBox(height: 18),
                EmailInputFb1(
                  inputController: _emailEditingController,
                ),
                SizedBox(
                  height: 18,
                ),
                PasswordInputFb1(
                  inputController: _passwordEditingController,
                  creatingAccount: true,
                ),
                SizedBox(height: 14),
                Container(
                  width: screenWidth * 0.90,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_emailEditingController.text == "" || _passwordEditingController.text == "" || _nameEditingController == "") {
                        setState(() {
                          errorText = "One or more fields are empty!"; 
                        });
                      } else {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => VisitorHome()), (Route<dynamic> route) => false);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromRGBO(255, 191, 99, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                (errorText != "") ? Center(child: Text(errorText, style: TextStyle(fontSize: 16, color: Colors.redAccent),)) : SizedBox(), 
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or using another method',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                GoogleBtn1(onPressed: () async {
                  dynamic credGoogle = await signInWithGoogle();
                  if (credGoogle.runtimeType != String) {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => VisitorHome()), (Route<dynamic> route) => false);
                  }

                }),
                SizedBox(height: 20),
                Center(
                  child: RichText(
                    text: TextSpan(children: [
                    ]),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
