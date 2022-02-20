import 'package:flutter/material.dart';
import 'package:solar_system/about_developer.dart';
import 'package:solar_system/comment_home.dart';
import 'package:solar_system/online_search.dart';

//import 'comment_home.dart';
//import 'detail_page.dart';
import 'constants.dart';
import 'home_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Drawer(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [gradientStartColor, gradientEndColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 0.7])),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 87.5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Developer()));
                    //Navigator.push(context, );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    color: gradientStartColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'About Developer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                //Divider(),
                Text(
                  '----------------------------------------------------------------',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 87.5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                    //Navigator.push(context, );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    color: gradientStartColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Make Comment',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                //Divider(),
                Text(
                  '----------------------------------------------------------------',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 87.5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                    //Navigator.push(context, );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      color: gradientEndColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Home Page',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  '----------------------------------------------------------------',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 87.5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnlineSearchPage()));
                    //Navigator.push(context, );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      color: gradientEndColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Search Page',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  '----------------------------------------------------------------',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        // backgroundColor: gradientStartColor,
      ),
    );
  }
}
