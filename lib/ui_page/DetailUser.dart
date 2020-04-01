import 'package:flutter/material.dart';
import 'package:flutterday3/ui_page/ModelUser.dart';

class DetailUser extends StatefulWidget {
  ModelUser data;
  DetailUser({this.data});
  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  int _groupValue = 0;

  void changeGroupValue(val){
    setState(() {
      _groupValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  height: 80,
                  width: 80,
                  child:
                    CircleAvatar(
                      child: Text(widget.data.id.toString(), style: TextStyle(fontSize: 32),),
                    )
                ),
              ),
            ),

            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Name : "+widget.data.name, style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Username : "+widget.data.username, style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Email : "+widget.data.email, style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Address : ", style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Street : "+widget.data.address.street, style: TextStyle(fontSize: 18),),
                                  Text("Suite : "+widget.data.address.suite, style: TextStyle(fontSize: 18),),
                                  Text("City : "+widget.data.address.city, style: TextStyle(fontSize: 18),),
                                  Text("Zipcode : "+widget.data.address.zipcode, style: TextStyle(fontSize: 18),),
                                  Text("Geo : ", style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(left:40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Lat : "+widget.data.address.geo.lat, style: TextStyle(fontSize: 18),),
                                  Text("Ln : "+widget.data.address.geo.lng, style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Phone : "+widget.data.phone, style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Website : "+widget.data.website, style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Company : ", style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Name : "+widget.data.company.name, style: TextStyle(fontSize: 18),),
                                  Text("catchPhrase : "+widget.data.company.catchPhrase, style: TextStyle(fontSize: 18),),
                                  Text("Bs : "+widget.data.company.bs, style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                          ),

                          Radio(
                            value: 1,
                            groupValue: _groupValue,
                            onChanged: (val){
                              changeGroupValue(val);
                            },
                          ),

                          Radio(
                            value: 2,
                            groupValue: _groupValue,
                            onChanged: (val){
                              changeGroupValue(val);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            )
          ],
        ),
      ),
    );
  }
}
