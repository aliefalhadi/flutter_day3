import 'package:flutter/material.dart';
import 'package:flutterday3/ui_page/DatePickerPage.dart';
import 'package:flutterday3/ui_page/RetrieveJSONPage.dart';
import 'package:flutterday3/ui_page/SearchViewPage.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Day 3"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("SearchView Page"),
              color: Colors.amberAccent,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchViewPage()));
              },
            ),

            RaisedButton(
              child: Text("Date Picker page"),
              color: Colors.red,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DatePickerpage()));
              },
            ),

            RaisedButton(
              child: Text("Retrieve JSON page"),
              color: Colors.lime,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>RetrieveJSONPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
