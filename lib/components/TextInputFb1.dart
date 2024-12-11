import 'package:flutter/material.dart';

class TextInputFb1 extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final Icon prefixIcon;
  const TextInputFb1({
    Key? key,
    required this.inputController,
    required this.hintText,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Updated orange theme colors
    const primaryColor = Color(0xffFF9800); // Orange
    const secondaryColor = Color(0xffF57C00); // Dark orange
    const accentColor = Color(0xffFFE0B2); // Light orange
    const backgroundColor = Color(0xffffffff); // White
    const errorColor = Color(0xffD32F2F); // Red for error

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.white.withOpacity(.9)),
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
                color: Colors.orange.withOpacity(.1)), // Subtle orange shadow
          ]),
          child: TextField(
            controller: inputController,
            onChanged: (value) {
              // Do something when the value changes
            },
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              prefixIconColor: Color(0xffFF9800),
              filled: true,
              fillColor: Colors.white, // Light orange background
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0), // Orange border
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: secondaryColor, width: 1.0), // Dark orange
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor, width: 1.0), // Red border for errors
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0), // Orange border
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
