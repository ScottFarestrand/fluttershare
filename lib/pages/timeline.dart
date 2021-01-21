// import 'dart:html';

import 'package:flutter/material.dart';
import '../widgets/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    print("Getting Users");
    getUsers();
    super.initState();
  }

  getUsers() {
    print("getting docs");
    usersRef.getDocuments().then((QuerySnapshot snapshot) {
      print("printing error");
      snapshot.documents.forEach((DocumentSnapshot doc) {
        print(doc.data);
      });
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: Text("TimeLine"),
    );
  }
}
