import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class DropDownMenuOptionVisitor extends StatefulWidget {
  const DropDownMenuOptionVisitor({super.key});

  @override
  State<DropDownMenuOptionVisitor> createState() =>
      _DropDownMenuOptionVisitorState();
}

class _DropDownMenuOptionVisitorState extends State<DropDownMenuOptionVisitor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Ionicons.person_outline),
          title: Text(
            "View Profile",
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(243, 179, 75, 1), // Default color
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Ionicons.settings_outline),
          title: Text(
            "Settings",
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(243, 179, 75, 1), // Default color
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Ionicons.log_out_outline),
          title: Text(
            "Sign Out",
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(243, 179, 75, 1), // Default color
              ),
            ),
          ),
        ),
      ],
    );
  }
}
