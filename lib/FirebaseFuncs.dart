
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore _db = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

Future<dynamic> doesUserExist(String uid) async {
  try {
    var userDoc = await _db.collection("users").doc(uid).get();
    
    if (userDoc.exists) {
      return true; 
    } else {
      return false; 
    }
  } catch (e) {
    print(e.toString());
    return e;
  }
}

dynamic addUserDoc(String uid) async {
  try {
    await _db.collection("users").doc(uid).set({"uid": uid});
    return "success";
  } catch (e) {
    return e; 
  }
}

dynamic addTrip(String uid, String name, String startDate, String endDate, String startLocation, String endLocation) async {
  try {
    await _db.collection("users").doc(uid).collection("trips").add({'name': name, 'startDate': startDate, 'endDate': endDate, "finalLocation": startLocation, "endLocation": endLocation});
    return "success!";  
  } catch (e) {
    return e;
  }
}