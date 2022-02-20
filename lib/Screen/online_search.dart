// main.dart
import 'package:flutter/material.dart';
import 'package:solar_system/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'comment_home.dart';
import 'constants.dart';
//import 'dami_data.dart';
import 'exit_app.dart';
import 'home_page.dart';
//import 'model/web_model.dart';

/*void main() {
  runApp(const MyApp());
}*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Solar_System',
      // home:
      // OnlineSearchPage(),
    );
  }
}

class OnlineSearchPage extends StatefulWidget {
  const OnlineSearchPage({Key? key}) : super(key: key);

  @override
  _OnlineSearchPageState createState() => _OnlineSearchPageState();
}

class _OnlineSearchPageState extends State<OnlineSearchPage> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well

  final List<Map<String, dynamic>> _allUsers = [
    /*{
      "id": 1,
      "name": InkWell(
        child: Text('Mercury'),
        onTap: () =>
            launch('https://solarsystem.nasa.gov/planets/mercury/overview/'),
      ),
      "position": '1st'
    },*/
    {
      "id": 1,
      "name": "Mercury",
      "position": '1st',
      /* "Url": 'https://solarsystem.nasa.gov/planets/mercury/overview/'*/
    },
    {"id": 2, "name": "Venus", "position": '2nd'},
    {"id": 3, "name": "Earth", "position": '3rd'},
    {"id": 4, "name": "Mars", "position": '4th'},
    {"id": 5, "name": "Jupiter", "position": '5th'},
    {"id": 6, "name": "Saturn", "position": '6th'},
    {"id": 7, "name": "Uranus", "position": '7th'},
    {"id": 8, "name": "Neptune", "position": '8th'},
    /*{"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},*/
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  final Count = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        drawer: MainDrawer(),
        backgroundColor: gradientEndColor,
        appBar: AppBar(
          title: Center(child: const Text('Solar_System')),
          backgroundColor: gradientStartColor,
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.account_circle_sharp))
          ],
          //elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStartColor, gradientEndColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 0.7])),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) => _runFilter(value),
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      //border: OutlineInputBorder(borderSide: BorderSide()),
                      labelText: 'Search',
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: _foundUsers.isNotEmpty
                      ? Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    gradientStartColor,
                                    gradientEndColor
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.3, 0.7])),
                          child: ListView.builder(
                            itemCount: _foundUsers.length,
                            itemBuilder: (context, index) => GestureDetector(
                              //child: Text("Click here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),),
                              onTap: () {
                                //print('click');
                                launch(
                                    'https://solarsystem.nasa.gov/planets/mercury/overview/');
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                key: ValueKey(_foundUsers[index]["id"]),
                                //color: Colors.amberAccent,
                                // elevation: 0,
                                // margin: const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  /*leading: Text(
                                    _foundUsers[index]["id"].toString(),
                                    style: const TextStyle(fontSize: 24),
                                  ),*/
                                  title: Text(
                                    _foundUsers[index]['name'],
                                    style: const TextStyle(
                                        //decoration: TextDecoration.underline,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                          '${_foundUsers[index]["position"].toString()} Solar_System '),
                                      /*Text(
                                          '${_foundUsers[index]["Url"].toString()} URL'),*/
                                      Text(
                                        'For more info from NASA',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFF0050AC),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : const Text('No results found',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic)),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(36.0),
            ),
            color: navigationColor,
          ),
          padding: const EdgeInsets.all(10),
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
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, a, b) =>
                          HomeScreen(), //(CModel: null,) //planetInfo: planets[index],),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
