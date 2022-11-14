import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:truckman/screen/HomeScreen.dart';

import 'SearchScreen.dart';
class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  int _selectedIndex = 0;
  static const List<String> _widgetOptions =[
   'Home',
   'SC',
   'Search',
 'Add',
    'Trips',
  ];

  final pages = [
     HomeScreen(),
    SearchScreen(),
    SearchScreen(),
    SearchScreen(),
    SearchScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if(index==0)
        {

        }
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
          title:  Text(_widgetOptions.elementAt(_selectedIndex),
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold,color: Colors.black))
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: const Color(0xfff203864),
          selectedItemColor: const Color(0xfff203864),
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/ic_home.svg"),
                label: 'sc',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/ic_search.svg"),
                label: 'Search',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/ic_trip.svg"),
              label: 'Create',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/ic_add.svg"),
                label: 'Add',
            ),
            BottomNavigationBarItem(
                icon:SvgPicture.asset("assets/images/ic_truck.svg"),
                label: 'Trips',
            ),
          ],
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }

}