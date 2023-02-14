import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projet1/screens/day.page.dart';
import 'package:projet1/screens/films.page.dart';
import 'package:projet1/screens/photos.page.dart';
import 'package:projet1/screens/welcome.page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int _activePage = 2;

  final List <dynamic> screens = [
    PhotoPage(),
    FilmPage(),
    WelcomePage(),
    DayPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.photo_library_outlined, size: 30),
      Icon(Icons.movie_creation_outlined, size: 30),
      Icon(Icons.laptop_chromebook_outlined, size: 30),
      Icon(Icons.date_range_outlined, size: 30),
    ];

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          items: items,
          key: navigationKey,
          color: Colors.blueGrey,
          buttonBackgroundColor: Colors.blue,
          backgroundColor: Colors.transparent,
          height: 55,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          index: _activePage,
          onTap: (index){
            setState(() {
              _activePage=index;
            });
            // Navigator.push(context, MaterialPageRoute(builder: (context) => screens[_activePage]));
          },
          letIndexChange: (index) => true,
        ),
      ),
      body: Container(
        child: Center(
          child: screens[_activePage],
        ),
      ),

    );
  }
}
