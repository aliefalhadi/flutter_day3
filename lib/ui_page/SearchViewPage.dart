import 'package:flutter/material.dart';

class SearchViewPage extends StatefulWidget {
  @override
  _SearchViewPageState createState() => _SearchViewPageState();
}

class _SearchViewPageState extends State<SearchViewPage> {

  List<String> dataList;
  List<String> filterList;
  TextEditingController etSearch = TextEditingController();
  String _search;

  filterData(){
    filterList = new List<String>();
    for(int i =0; i < dataList.length; i++){
      var item = dataList[i];
      if(item.toLowerCase().contains(_search.toLowerCase())){
        filterList.add(item);
      }
    }
    return _filterListView();
  }

  _SearchViewPageState(){
    etSearch.addListener((){
      if(etSearch.text.isEmpty){
        setState(() {
          _search = "";
        });
      }else{
        setState(() {
          _search = etSearch.text.toString();
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList = [
      "Snake", "Girrafe", "Goose", "Pelican", "Monkey", "Horse", "Zebra", "Butterfly", "Elephant", "Cat", "Dog",
      "Snake1", "Girrafe1", "Goose1", "Pelican1", "Monkey1", "Horse1", "Zebra1", "Butterfly1", "Elephant1", "Cat1", "Dog1",
    ];
  }


  Widget _formSearchView(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        child: SizedBox(
          height: 40,
          child: TextFormField(
            controller: etSearch,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: "Search Query",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),

              )
            ),
            textAlign: TextAlign.start,
//        onChanged: (val){
//          print(_search);
//          setState(() {
//            if(val == ""){
//              _search = n
//            }else{
//              _search = val;
//
//            }
//          });
//        },
          ),
        ),
      ),
    );
  }


  Widget _createListView(){
    return Flexible(
      child: ListView.builder(
        itemCount: dataList.length,
          itemBuilder: (context, index){
            return Card(
              elevation: 3,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Text(dataList[index]),
              ),
            );
          }
      ),
    );
  }

  Widget _filterListView(){
    return Flexible(
      child: ListView.builder(
          itemCount: filterList.length,
          itemBuilder: (context, index){
            return Card(
              elevation: 5,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Text(filterList[index]),
              ),
            );
          }
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("Page Search View List")
      ),

      body: Column(
        children: <Widget>[
          _formSearchView(),
          SizedBox(height: 20,),
          etSearch.text.isEmpty == true ?
          _createListView()
              :
              filterData()
        ],
      ),
    );
  }
}
