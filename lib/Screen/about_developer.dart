import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solar_system/drawer.dart';

import 'comment_home.dart';
import 'constants.dart';
import 'exit_app.dart';
import 'home_page.dart';
import 'online_search.dart';

class Developer extends StatelessWidget {
  const Developer({Key? key}) : super(key: key);
  //static String tag = 'home-page';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        drawer: MainDrawer(),
        backgroundColor: gradientEndColor,
        appBar: AppBar(
          backgroundColor: Color(0xFF0050AC),
          title: Center(child: (Text('About Developer'))),
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.account_circle_sharp))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStartColor, gradientEndColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 0.7])),
          child: Center(
            child: Container(
              height: 500,
              width: 300,
              child: Card(
                //color: gradientStartColor,
                color: gradientSkyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Container(
                            //color: Color(0xFF0050AC),
                            height: 120.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              //color: Color(0xFF0050AC),
                              image: DecorationImage(
                                image: AssetImage('assets/pro.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '             Prodosh Das ' '\n',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Avenir',
                            ),
                            //style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              TextSpan(
                                text: '                  B.Sc. Hons in CSE\n\n'
                                    ' Linux Certified, Web Developer,\n'
                                    ' Technical Support, Flutter Developer.\n'
                                    ' Programming Language: Java, C++, C,\n PHP, Dart, '
                                    'Java Script, SQL .\n\n Database: SQL Database,\n'
                                    ' Oracle Database, My Sql Database, \n Sqlite Database. \n',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontFamily: 'Avenir',
                                ),
                              ),
                              TextSpan(
                                text: '\nWorking Experiences:\n'
                                    '1. I was working as IT Consultant\n    for SylhetSanglap. \n'
                                    '2. I was working as Deployment \n'
                                    '    Engineer for Genesis Technology Group.\n'
                                    '3. I was working as SRM  for MRP/V\n    Gov Project.\n'
                                    '4. Now i am working as IT \n     Support Engineer.\n',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontFamily: 'Avenir',
                                ),
                              ),
                              /*TextSpan(
                                  text: 'bold',
                                  style: TextStyle(color: Colors.white)),
                              TextSpan(text: ' world!'),*/
                            ],
                          ),
                        )
                      ],
                    ),
                    /* Row(
                        RichText(
                          text: TextSpan(
                            text: 'BSC Honr\'s in CSE ',
                            style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'bold',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' world!'),
                            ],
                          ),
                        )
                      ],
                    ),*/
                  ],
                ),
              ),
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
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, a, b) =>
                            HomeScreen() //planetInfo: planets[index],),
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
