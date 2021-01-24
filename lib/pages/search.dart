import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  AppBar buildSearchScreen() {
    return AppBar(
      backgroundColor: Colors.white,
      title: TextFormField(
        decoration: InputDecoration(
          hintText: "Search for a User",
          filled: true,
          prefixIcon: Icon(
            Icons.account_box,
            size: 28,
          ),
          suffix: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => print("Cleared"),
          ),
        ),
      ),
    );
  }

  Container buildNoContent() {
    final orientaton = MediaQuery.of(context).orientation;
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SvgPicture.asset(
              'assets/images/search.svg',
              // height: 300,
              height: orientaton == Orientation.portrait ? 300.0 : 200.0,
            ),
            Text(
              "Find Users",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 60.0,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
        appBar: buildSearchScreen(),
        body: buildNoContent());
  }
}

class UserResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("User Result");
  }
}
