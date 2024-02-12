import 'package:delivery_people/src/core/services/page_management.dart';
import 'package:delivery_people/src/pages/overview/overview_page.dart';
import 'package:delivery_people/src/pages/profile/profile_page.dart';
import 'package:delivery_people/src/pages/report/report_page.dart';
import 'package:delivery_people/src/store/user.store.dart';
import 'package:delivery_people/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserStore _userStore;
  int _selectedIndexNavigationBottom = 1;

  @override
  void initState() {
    super.initState();
    _userStore = Provider.of<UserStore>(context, listen: false);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexNavigationBottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (_userStore.isLoading) {
            return Center(child: CircularProgressIndicator(),);
          } else {
            return IndexedStack(
              index: _selectedIndexNavigationBottom,
              children: PageManagement.widgetOptions,
            );
          }
        },
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
            label: 'Visão geral',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined, size: 28),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndexNavigationBottom,
        onTap: _onItemTapped,
      ),
    );
  }
}
