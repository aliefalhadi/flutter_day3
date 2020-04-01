import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DatePickerpage extends StatefulWidget {
  @override
  _DatePickerpageState createState() => _DatePickerpageState();
}

class _DatePickerpageState extends State<DatePickerpage> {
  DateTime _dueDate = DateTime.now();
  TimeOfDay _dueTime = TimeOfDay.now();
  String _dateText = "";

//  Future selectDueDate(BuildContext context) async {
//    var picked = await showDatePicker(
//        context: context,
//        initialDate: _dueDate,
//        firstDate: DateTime(1945),
//        lastDate: DateTime(2099)
//    );
//
//    if(picked != null){
//        setState(() {
//          _dueDate = picked;
//        });
//
//        selectdueTime(context);
//    }else{
//
//    }
//  }

  Future selectDueDate(BuildContext context) async {

    DatePicker.showDatePicker(
      context,
      initialDateTime: _dueDate,
      pickerMode: DateTimePickerMode.datetime,
dateFormat: "yyyy/MM/dd HH:mm:ss",
//      dateFormat: 'HH:mm:ss',
      onConfirm: (dateTime, List<int> index){
        setState(() {
          _dueDate = dateTime;
        });
      }
    );

//    if(picked != null){
//      setState(() {
//        _dueDate = picked;
//      });
//
//      selectdueTime(context);
//    }else{
//
//    }
  }

  Future selectdueTime(BuildContext context) async {
    var picked = await showTimePicker(context: context, initialTime: _dueTime);

    if(picked != null){
      setState(() {
        _dueTime = picked;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datepicker Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 32),
        child: Column(
          children: <Widget>[
            Text("My Selected Date Is : "),
            FlatButton(
              child: Text("${_dueDate.day} / ${_dueDate.month} / ${_dueDate.year}  ${_dueDate.hour} : ${_dueDate.minute} : ${_dueDate.second}"),
              onPressed: (){
                selectDueDate(context);
              },
            ),
            Text("My Birthday Is : "),
            FlatButton(
              child: Text("${_dueDate.day} / ${_dueDate.month} / ${_dueDate.year}  ${_dueDate.hour} : ${_dueDate.minute} : ${_dueDate.second}"),
              onPressed: (){
                selectDueDate(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
