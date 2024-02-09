import 'package:delivery_people/src/pages/overview/overview_page.dart';
import 'package:delivery_people/src/pages/profile/profile_page.dart';
import 'package:delivery_people/src/pages/report/report_page.dart';
import 'package:delivery_people/src/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndexNavigationBottom = 1;
  List<Widget> _widgetOptions = <Widget>[
    ReportPage(),
    OverviewPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexNavigationBottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndexNavigationBottom,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.orange,
        unselectedItemColor: AppColors.gray3,
        selectedIconTheme: IconThemeData(color: AppColors.orange),
        unselectedIconTheme: IconThemeData(color: AppColors.gray3),
        selectedLabelStyle: TextStyle(fontSize: 16),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_open_outlined, size: 28),
            label: 'Relatórios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 28),
            label: 'Relatórios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined, size: 28),
            label: 'Relatórios',
          ),
        ],
        currentIndex: _selectedIndexNavigationBottom,
        onTap: _onItemTapped,
      ),
    );
  }
}
