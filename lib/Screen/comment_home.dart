import 'package:flutter/material.dart';
import 'package:solar_system/drawer.dart';
import 'package:solar_system/home_page.dart';
import 'constants.dart';
import 'model/dami_data.dart';
import 'database_helper.dart';
import 'model/model.dart';
import 'online_search.dart';
import 'exit_app.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  //var now;
  //final _formKey = GlobalKey<FormState>();
  bool _validate = false;
  int? selectId;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    List<User_Cmnt> cmntData = [];
    cmntData.add(
        User_Cmnt(name: 'by Prodosh', cmt: 'Nice App, Background is awesome')
        //Cmnt('Prodosh', 'Nice', name1: 'Prodosh', cmt1: 'Good'),
        );
    cmntData.add(User_Cmnt(name: 'by Gudholi', cmt: 'Awesome App'));
    cmntData.add(User_Cmnt(name: 'by Bappy', cmt: 'Great Job'));
    cmntData.add(User_Cmnt(name: 'by Adil', cmt: 'Keep it up'));
    cmntData.add(User_Cmnt(name: 'by Rana', cmt: 'Well Done'));
    cmntData.add(User_Cmnt(name: 'by Hasan', cmt: 'Great Design'));
    cmntData.add(User_Cmnt(name: 'by Maruf', cmt: 'So good'));
    cmntData.add(
        User_Cmnt(name: 'by Priyungshu', cmt: 'Color Combination is so good'));
    cmntData.add(
        User_Cmnt(name: 'by Pritom', cmt: 'One of the most well design app'));

    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        drawer: MainDrawer(),
        backgroundColor: gradientEndColor,
        //backgroundColor: Colors.blue,
        floatingActionButton: ElevatedButton(
            onPressed: () {
              print(_controller.text);
              setState(() {
                _controller.text.isEmpty ? _validate = true : _validate = false;

                if (selectId == null && _controller.text.isNotEmpty) {
                  DatabaseHelper.instance.add(Grocery(name: _controller.text));

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color(0xFF0050AC),
                      content: Text('Data Submitted Successfully !!'),
                      duration: const Duration(milliseconds: 2000),
                      width: 250.0,
                      behavior: SnackBarBehavior.floating,
                      // shape: RoundedRectangleBorder(),
                      /*padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, // Inner padding for SnackBar content.
                    ),*/
                    ),
                  );
                } else if (selectId != null) {
                  DatabaseHelper.instance
                      .update(Grocery(name: _controller.text, id: selectId));
                  selectId = null;

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color(0xFF0050AC),
                      content: Text('Data Updated Successfully !!'),
                      duration: const Duration(milliseconds: 2000),
                      width: 250.0,
                      behavior: SnackBarBehavior.floating,
                      //shape: RoundedRectangleBorder(),
                      /*padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, // Inner padding for SnackBar content.
                    ),*/
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color(0xFF0050AC),
                      content: Text('Please Write Comment First !!'),
                      duration: const Duration(milliseconds: 4000),
                      width: 250.0,
                      behavior: SnackBarBehavior.floating,
                      //shape: RoundedRectangleBorder(),
                      /*padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, // Inner padding for SnackBar content.
                    ),*/
                    ),
                  );
                }
                _controller.text = '';
              });
            },
            child: Text('SUBMIT'),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF0050AC),
            )
            //child: Icon(Icons.add),
            ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            /*shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),*/
            title: Card(
              child: Container(
                height: 100,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  //textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: 'Write Comment Here',
                    errorText: _validate ? 'Text field Can\'t Be Empty' : null,
                  ),
                  controller: _controller,
                ),
              ),
            ),
            backgroundColor: gradientStartColor, //Colors.blueGrey,
            actions: [
              IconButton(
                onPressed: null,
                icon: Icon(Icons.account_circle_sharp),
              )
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStartColor, gradientEndColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 0.7])),
          child: FutureBuilder<List<Grocery>>(
            future: DatabaseHelper.instance.getGrocery(),
            builder: (context, snapshot) {
              if (snapshot.data!.isEmpty) {
                return Center(
                  child: ListView.builder(
                    // Let the ListView know how many items it needs to build.
                    itemCount: cmntData.length,
                    // Provide a builder function. This is where the magic happens.
                    // Convert each item into a widget based on the type of item it is.
                    itemBuilder: (context, index) {
                      final item = cmntData[index];
                      return Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          child: ListTile(
                            //title: Text('{$item.cmt1,$item.name1}'),
                            title: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                item.cmt,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            //title: item.buildTitle(context),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(item.name),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
                /*return Center(
                  child: Text('no List Found'),
                );*/
              } else {
                return ListView(
                  children: snapshot.data!.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(0.0),
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
                            child: Text(
                              e.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Center(
                              child: Text(
                            'Single Tap to update the comment',
                          )),
                          //subtitle: Text(e.id.toString()),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, a, b) =>
                            OnlineSearchPage() //planetInfo: planets[index],),
                        ),
                  );
                },
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
      ),
    );
  }
}
