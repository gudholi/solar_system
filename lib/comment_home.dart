import 'package:flutter/material.dart';
import 'package:solar_system/home_page.dart';
import 'constants.dart';
//import 'dami_data.dart';
import 'database_helper.dart';
import 'model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    /*required this.CModel*/
  }) : super(key: key);

  //final Cmnt CModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  //var now;
  int? selectId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          print(_controller.text);
          setState(() {
            if (selectId == null && _controller.text.isNotEmpty) {
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
              //border: OutlineInputBorder(),
              labelText: 'Write Comment Here',
            ),
            controller: _controller,
            onSubmitted: (String value) async {
              await showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thanks!'),
                    content: Text(
                        'You typed "$value", which has length ${value.characters.length}.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder<List<Grocery>>(
        future: DatabaseHelper.instance.getGrocery(),
        builder: (context, snapshot) {
          if (snapshot.data!.isEmpty && _controller.text.isNotEmpty) {
            return Center(
              child: Text('no List Found'),
            );
          } else {
            return ListView(
              children: snapshot.data!.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
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
                      title: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(e.name),
                      ),
                      //subtitle: Text('now'),
                      //subtitle: Text(e.id.toString()),
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/menu_icon.png'),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, a, b) => HomePage(
                        //planetInfo: planets[index],
                        ),
                  ),
                );
              },
            ),
            IconButton(
              icon: Image.asset('assets/search_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/comm.png'),
              onPressed: () {
                /*Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, a, b) => HomeScreen(CModel: null,) //planetInfo: planets[index],),
                      ),
                );*/
              },
            ),
          ],
        ),
      ),
    );
  }
}
