import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../pages/categories_screen.dart';
import '../pages/favorite_screen.dart';
import '../widgets/app_drawer.dart';

class TabsScreens extends StatefulWidget {
 

final List<Trip>favoritetrips;
const TabsScreens(this.favoritetrips, {super.key});
  @override
  State<TabsScreens> createState() => _TabsScreens();
}

class _TabsScreens extends State<TabsScreens> {
  int _selectedscreenindex = 0;
  void _selectscreen(int index) {
    setState(() {
      _selectedscreenindex = index;
    });
  }

  late final List<Map<String, dynamic>> _screens=[{
      'Screen': const CategoriesScreen(),
      'Title': 'categories',
    },
    {
      'Screen':  FavoriteScreen(widget.favoritetrips),//widget.favoritetrips
      'Title': 'favorite',
    }];
  // @override
  // void initState() {
  //  _screens== [
    
  // ];
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedscreenindex]['Title']),
        backgroundColor: Colors.amber,
      ),
      drawer: const AppDrawer(),
      body: _screens[_selectedscreenindex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        currentIndex: _selectedscreenindex,
        onTap: _selectscreen,
        backgroundColor: Colors.amber[600],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'favorite',
          ),
        ],
      ),
    );
  }
}
