import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:solar_system/comment_home.dart';
import 'constants.dart';
import 'data.dart';
import 'detail_page.dart';
import 'online_search.dart';
import 'exit_app.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _ratingValue = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: gradientEndColor,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [gradientStartColor, gradientEndColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 0.7])),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Explore - \n Solar System',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 44,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        /*DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Solar System',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 24,
                                  color: const Color(0x7cdbf1ff),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                          onChanged: (value) {},
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Image.asset('assets/drop_down_icon.png'),
                          ),
                          underline: SizedBox(),
                        ),*/
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    padding: const EdgeInsets.only(left: 32),
                    child: Swiper(
                      itemCount: planets.length,
                      itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                      layout: SwiperLayout.STACK,
                      pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            activeSize: 20, space: 8),
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, a, b) => DetailPage(
                                  planetInfo: planets[index],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  SizedBox(height: 100),
                                  Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 100),
                                          Text(
                                            planets[index].name,
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 40,
                                              color: const Color(0xff47455f),
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            'Solar System',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 23,
                                              color: primaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 30),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'Know more',
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color: secondaryTextColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Icon(
                                                Icons.arrow_forward,
                                                color: secondaryTextColor,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '\nPlease Write Comment Using BottomNavigation Comment Icon.',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 14,
                                              color: primaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Hero(
                                tag: planets[index].position,
                                child: Image.asset(planets[index].iconImage),
                              ),
                              Positioned(
                                right: 24,
                                bottom: 60,
                                child: Text(
                                  planets[index].position.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 200,
                                    color: primaryTextColor.withOpacity(0.08),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      'Rate My App ? By *Prodosh*',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                            full: Icon(Icons.star, color: Colors.orange),
                            half: Icon(
                              Icons.star_half,
                              color: Colors.orange,
                            ),
                            empty: Icon(
                              Icons.star_outline,
                              color: Colors.white,
                            )),
                        onRatingUpdate: (value) {
                          setState(() {
                            _ratingValue = value;
                          });
                        }),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFF9354B9), shape: BoxShape.circle),
                      alignment: Alignment.center,
                      child: Text(
                        _ratingValue != null
                            ? _ratingValue.toString()
                            : 'Rate it!',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  )
                ],
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
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset('assets/search_icon.png'),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, a, b) => OnlineSearchPage(
                          //planetInfo: planets[index],
                          ),
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
                      pageBuilder: (context, a, b) => HomeScreen(
                          //planetInfo: planets[index],
                          ),
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
