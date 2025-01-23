import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatelessWidget {
  final String username;
  final String comment;
  final String dateTime;

  const CommentCard({
    Key? key,
    required this.username,
    required this.comment,
    required this.dateTime,
  }) : super(key: key);

  String formatDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('MM/dd/yyyy @ hh:mm');
  return formatter.format(dateTime);
}
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Username
                Text(
                  username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromRGBO(243, 179, 75, 1)
                  ),
                ),
                Text(
                  formatDateTime(DateTime.parse(dateTime)),
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(243, 179, 75, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              comment,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
