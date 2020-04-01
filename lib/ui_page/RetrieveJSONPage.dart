import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterday3/ui_page/DetailUser.dart';
import 'package:flutterday3/ui_page/ModelUser.dart';
import 'package:http/http.dart' as http;

class ConstantUrl {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/users";
}

class RetrieveJSONPage extends StatefulWidget {
  @override
  _RetrieveJSONPageState createState() => _RetrieveJSONPageState();
}

class _RetrieveJSONPageState extends State<RetrieveJSONPage> {
//  List _dataUsers;

  Future<List> getUsers() async {
    final response = await http.get(ConstantUrl.baseUrl);
    var listData = modelUserFromJson(response.body);
    return listData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve JSON Page"),
      ),
      body: FutureBuilder(
          future: getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            List _userData = snapshot.data;
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: _userData.length,
                    itemBuilder: (BuildContext context, int index) {
                      ModelUser data = _userData[index];
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return DetailUser(
                              data:data
                            );
                          }));
                        },
                        child: Card(
                          child: Container(
                            margin: EdgeInsets.all(16),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  child: Text(data.id.toString()),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(data.name),
                                    Text(data.username),
                                    Text(data.email),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Retrieve JSON Page"),
//      ),
//      body: _dataUsers == null
//        ? Center(child: CircularProgressIndicator(),)
//          :
//      ListView.builder(
//        itemCount: _dataUsers.length,
//          itemBuilder: (BuildContext context, int index){
//            final data = _dataUsers[index];
//            return Card(
//              child: Container(
//                margin: EdgeInsets.all(16),
//                child: Row(
//                  children: <Widget>[
//                    CircleAvatar(
//                      child: Text(data["id"].toString()),
//                    ),
//                    SizedBox(width: 30,),
//                    Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text(data["name"]),
//                        Text(data["username"]),
//                        Text(data["email"]),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//            );
//          }
//      ),
//    );
//  }
//}
