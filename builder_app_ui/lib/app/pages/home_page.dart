import 'package:builder_app_ui/app/app_store.dart';
import 'package:builder_app_ui/app/data/models/app_generate.dart';
import 'package:builder_app_ui/app/viewmodel/home_viewmodel.dart';
import 'package:builder_app_ui/app/widgets/card_creating.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  final _homeViewModel = HomeViewModel();
  List<AppGenerate>? _appGeneratedValue;

  @override
  void initState() {
    _fetchAppGeneratedValue();
    super.initState();
  }

  void _fetchAppGeneratedValue() async {
    final appGeneratedValue = await _homeViewModel.fetchAppGeneratedValues();
    setState(() {
      _appGeneratedValue = appGeneratedValue;
    });
  }

  void _onItemTap(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppStore appStore = Provider.of<AppStore>(context);

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
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Icon(Icons.ac_unit, size: 40),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (appStore.themeMode == ThemeMode.system ||
                  appStore.themeMode == ThemeMode.light) {
                appStore.switchTheme(ThemeMode.dark);
              } else {
                appStore.switchTheme(ThemeMode.light);
              }
            },
            icon: Icon(
              appStore.themeMode == ThemeMode.system ||
                      appStore.themeMode == ThemeMode.light
                  ? Icons.mode_night_outlined
                  : Icons.wb_sunny_outlined,
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
            color: Theme.of(context).buttonTheme.colorScheme?.background,
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
                  Text(
                    'Hi Paulo',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Here are your sites',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),

              // Cards AI and New Site
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CardCreating(
                    height: 120,
                    width: 140,
                    boxColorPrimary: Colors.green.shade500,
                    boxColorSecondary: Colors.green.shade200,
                    iconContainer: Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 32,
                    ),
                    textTitle: 'AI',
                    textDescription: 'Create with AI',
                  ),
                  CardCreating(
                    height: 120,
                    width: 140,
                    boxColorPrimary: Colors.grey.shade500,
                    boxColorSecondary: Colors.grey.shade200,
                    iconContainer: Icon(
                      Icons.menu_open,
                      color: Colors.white,
                    ),
                    textTitle: 'New Site',
                    textDescription: 'Create with Blank',
                  ),
                ],
              ),

              SizedBox(height: 20),
              // List cards created
              Expanded(
                child: ListView.builder(
                  itemCount: _appGeneratedValue?.length ?? 0,
                  itemBuilder: (context, index) {
                    if (_appGeneratedValue != null) {
                      final value = _appGeneratedValue![index];

                      return Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Theme.of(context).cardColor,
                          border: Border.all(
                            width: 2,
                            color: Colors.grey.shade200,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: ListTile(
                            leading: Container(
                              height: 60,
                              width: 60,
                              child: Card(
                                child: Icon(Icons.ac_unit, color: Colors.white),
                                color: value.typeApp == 'APP'
                                    ? Colors.green
                                    : Colors.orangeAccent,
                                shadowColor: Colors.grey,
                              ),
                            ),
                            title: Text(
                              value.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              '${value.typePayment} * ${value.publishad ? 'Published' : 'Unpublished'}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.more_horiz),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      );
                    }
                    // Progress Indicator
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
