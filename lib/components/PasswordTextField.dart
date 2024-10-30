import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class PasswordInputFb1 extends StatefulWidget {
  final TextEditingController inputController;
  final bool creatingAccount;
  const PasswordInputFb1(
      {Key? key, required this.inputController, required this.creatingAccount})
      : super(key: key);

  @override
  State<PasswordInputFb1> createState() => _PasswordInputFb1State();
}

class _PasswordInputFb1State extends State<PasswordInputFb1> {
  bool pwdVisibility = false;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromRGBO(249, 168, 38, 1);
    const secondaryColor = Color.fromRGBO(236, 183, 102, 1);
    const accentColor = Color(0xffffffff);
    const backgroundColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: GoogleFonts.dmSans(
            textStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Default color
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1)),
          ]),
          child: TextField(
            obscureText: !pwdVisibility,
            controller: widget.inputController,
            onChanged: (value) {
              //Do something wi
            },
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Ionicons.lock_closed_outline,
                color: primaryColor,
              ),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    pwdVisibility = !pwdVisibility;
                  });
                },
                child: Icon(
                  pwdVisibility
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: secondaryColor,
                  size: 22,
                ),
              ),
              filled: true,
              fillColor: accentColor,
              hintText: 'Enter your password',
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),

        (widget.creatingAccount == false) ? 
        (Row(
          mainAxisAlignment:
              MainAxisAlignment.end, // Align the text to the right
          children: [
            GestureDetector(
              onTap: () {
                print("Forgot Password");
              },
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )) : (Text(""))
      ],
    );
  }
}
