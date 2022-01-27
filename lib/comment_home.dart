import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  var now;
  int? selectId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          print(_controller.text);
          setState(() {
            if (selectId == null) {
              DatabaseHelper.instance.add(Grocery(name: _controller.text));
            } else {
              DatabaseHelper.instance
                  .update(Grocery(name: _controller.text, id: selectId));
              selectId = null;
            }
            _controller.text = '';
          });
        },
        child: Text('SUBMIT'),
        //child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Card(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Write Comment Here',
            ),
            controller: _controller,
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder<List<Grocery>>(
        future: DatabaseHelper.instance.getGrocery(),
        builder: (context, snapshot) {
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text('no List Found'),
            );
          } else {
            return ListView(
              children: snapshot.data!.map((e) {
                return Card(
                  child: ListTile(
                    onLongPress: () {
                      setState(() {
                        DatabaseHelper.instance.remove(e.id!);
                      });
                    },
                    onTap: () {
                      //var now = DateTime.now();
                      _controller.text = e.name;
                      selectId = e.id;
                    },
                    title: Text(e.name),
                    //subtitle: Text('now'),
                    //subtitle: Text(e.id.toString()),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
