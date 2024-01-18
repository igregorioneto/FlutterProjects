import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).cardColor,
        currentIndex: _currentPageIndex,
        iconSize: 32,
        selectedLabelStyle:
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 18),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_outlined),
            label: 'Templates',
          ),
        ],
        onTap: _onItemTap,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15),
          child: Icon(Icons.ac_unit, size: 40),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.motion_photos_on_outlined,
              size: 30,
            ),
          ),
          SizedBox(width: 10),
          MaterialButton(
            height: 40,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onPressed: () {},
            child: Text(
              'Upgrade',
              style: TextStyle(
                color: Theme.of(context).textTheme.headline5?.color,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Theme.of(context)
                .buttonTheme
                .colorScheme
                ?.background,
          ),
          SizedBox(width: 10),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/avatar.jpg'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              // Salutation
              Row(
                children: [
                  Text('Hi Paulo', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ],
              ),
              Row(
                children: [
                  Text('Here are your sites', style: TextStyle(fontSize: 18),),
                ],
              )

              // Cards AI and New Site

              // List cards created

            ],
          ),
        ),
      ),
    );
  }
}
