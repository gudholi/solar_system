import 'package:flutter/material.dart';

void main() => runApp(Date());

class Date extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Get Current Date in Flutter')),
            body: Center(child: GetDate())));
  }
}

class GetDate extends StatefulWidget {
  _GetDateState createState() => _GetDateState();
}

class _GetDateState extends State<GetDate> {
  String finalDate = '';

  getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    setState(() {
      finalDate = formattedDate.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Date = $finalDate",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )),
          /*RaisedButton(
            onPressed: getCurrentDate,
            color: Colors.green,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text('Click Here To Get Current Date in Flutter'),
          ),*/
        ],
      ),
    ));
  }
}
