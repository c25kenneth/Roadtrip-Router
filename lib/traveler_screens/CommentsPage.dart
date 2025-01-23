import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_gallery/FirebaseFuncs.dart';
import 'package:go_gallery/LoadingScreen.dart';
import 'package:go_gallery/components/CommentCard.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add a Comment",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              // Username Text Field
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              // Comment Text Field
              TextField(
                controller: commentController,
                decoration: const InputDecoration(
                  labelText: "Comment",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () async {
                    final username = usernameController.text.trim();
                    final comment = commentController.text.trim();
                    if (username.isNotEmpty && comment.isNotEmpty) {
                      await addComment(username, DateTime.now().toString(), comment);
                      usernameController.clear(); 
                      commentController.clear(); 
                    }
                  },
                  child: const Text("Submit", style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(243, 179, 75, 1),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
      }, child: Icon(Icons.comment_outlined, color: Colors.white,), backgroundColor: Color.fromRGBO(243, 179, 75, 1),),
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('trips').doc("hPze5xs4K9sdKGKl37p3").collection('comments').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(child: ListView.builder(itemCount: snapshot.data!.docs.length, itemBuilder: (context, index) {
              return CommentCard(username: snapshot.data!.docs[index]["userName"], comment: snapshot.data!.docs[index]['comment'], dateTime: snapshot.data!.docs[index]["dateTime"]);
            }));
          } else {
            return LoadingScreen(); 
          }
        }
      ),
    );
  }
}