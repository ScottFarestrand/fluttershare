// import 'dart:html';

import 'package:flutter/material.dart';
import '../widgets/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/progress.dart';

final CollectionReference usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  // List<dynamic> users = [];

  @override
  void initState() {
    print("Getting Users");
    // getUsers();
    super.initState();
  }

  // getUsers() async {
  //   final QuerySnapshot snapShot = await usersRef.getDocuments();
  //
  //   setState(() {
  //     users = snapShot.documents;
  //   });
  //
  //   // print("getting docs");
  //   // usersRef.getDocuments().then((QuerySnapshot snapshot) {
  //   //   print("printing error");
  //   //   snapshot.documents.forEach((DocumentSnapshot doc) {
  //   //     print(doc.data);
  //   //   });
  //   // });
  // }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (Context, snapShot) {
          if (!snapShot.hasData) {
            return CircularProgress();
          }
          final List<Text> children = snapShot.data.documents
              .map((doc) => Text(doc["username"]))
              .toList();
          return Container(
            child: ListView(children: children),
          );
        },
      ),
    );
  }

// Widget build(context) {
//   return Scaffold(
//     appBar: header(context, isAppTitle: true),
//     body: Container(
//       child: ListView(
//         children: users.map((user) => Text(user["username"])).toList(),
//       ),
//     ),
//   );
// }
}
