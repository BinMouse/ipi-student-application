import 'package:flutter/material.dart';

import 'package:ipi_app/pages/menu_page.dart';
import 'package:ipi_app/pages/profile_page.dart';
import 'package:ipi_app/pages/news_page.dart';
import 'package:ipi_app/pages/calendar_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variables
  int _currentIndex = 0;
  String _currentAppBarTitle = '';

  // Pages List
  final List<Widget> _pages = [
    NewsPage(),
    CalendarPage(),
    ProfilePage(),
    MenuPage(),
  ];

  final List<String> _pagesTitles = [
    'Главная',
    'Календарь',
    'Профиль',
    'Меню',
  ];

  void _onTabTapped(int index){
    setState(() {
      _currentIndex = index;
      _currentAppBarTitle = _pagesTitles[index];
    });
  }

  @override
  void initState() {
    super.initState();
    _currentAppBarTitle = _pagesTitles[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight+10),
        child: AppBar(
          title: Text(_currentAppBarTitle, style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontSize: 30,
          ),),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.lightBlue.shade100,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              )
            ),
          ),
        ),
      ),


      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [

          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: _pagesTitles[0],
            backgroundColor: Colors.blue[400],
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
            ),
            label: _pagesTitles[1],
            backgroundColor: Colors.blue[400],
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: _pagesTitles[2],
            backgroundColor: Colors.blue[400],
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view,
            ),
            label: _pagesTitles[3],
            backgroundColor: Colors.blue[400],
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
