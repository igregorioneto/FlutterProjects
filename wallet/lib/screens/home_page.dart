import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:wallet/providers/theme_provider.dart';
import 'package:wallet/services/chart_service.dart';
import 'package:wallet/viewmodel/home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoaded = false;
  int _currentIndex = 0;
  LineChartData? _chartData;

  // ChartService chartService = ChartService();
  final homeViewModel = HomeViewModel();

  @override
  void initState() {
    // Future.delayed(Duration(seconds: 2), () {
    //   setState(() {
    //     _isLoaded = true;
    //   });
    // });
    _fetchData();
    super.initState();
  }

  void _fetchData() async {
    LineChartData chartData = await homeViewModel.fetchChartData(_isLoaded);
    setState(() {
      _chartData = chartData;
      _isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.moon,
          //     color: Colors.blueGrey,
          //   ),
          // ),
          Switch(
            value: themeProvider.darkTheme,
            activeColor: Theme.of(context).buttonTheme.colorScheme?.primary,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,

      // Menu bottom for navigation
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        margin: EdgeInsets.only(bottom: 30, top: 10, right: 20, left: 20),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.explore_outlined),
            title: Text("Likes"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.data_usage),
            title: Text("Search"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text("Profile"),
          ),
        ],
      ),

      // Body app
      body: NestedScrollView(
        headerSliverBuilder: (context, bool boxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  // Title, Balance and Graphics
                  children: [
                    FadeInUp(
                      child: Text(
                        "Balance",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline5?.color,
                          fontSize: 20,
                        ),
                      ),
                      duration: Duration(milliseconds: 800),
                    ),
                    SizedBox(height: 20),
                    FadeInUp(
                      child: Text(
                        "\$ 1,000,000",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline5?.color,
                          fontSize: 40,
                        ),
                      ),
                      duration: Duration(milliseconds: 800),
                    ),
                    FadeInUp(
                      child: Container(
                        width: double.infinity,
                        height: 250,
                        child: _chartData != null
                            ? LineChart(
                                // chartService.mainData(_isLoaded),
                                _chartData!,
                                swapAnimationDuration:
                                    Duration(milliseconds: 1000),
                                swapAnimationCurve: Curves.linear,
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },

        // Body transactions
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
                duration: Duration(milliseconds: 1000),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("/");
                      },
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Theme.of(context).buttonTheme.colorScheme?.primary,
                      child: Row(
                        children: [
                          Icon(Iconsax.wallet,
                              color: Theme.of(context).primaryColor),
                          SizedBox(width: 10),
                          Text(
                            "Payment",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    MaterialButton(
                      onPressed: () {},
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      color: Colors.transparent,
                      splashColor: Theme.of(context)
                          .buttonTheme
                          .colorScheme
                          ?.primary
                          .withOpacity(0.4),
                      highlightColor: Theme.of(context)
                          .buttonTheme
                          .colorScheme
                          ?.primary
                          .withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color(0xff02d39a).withOpacity(0.4),
                            width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Iconsax.arrow_3,
                              color: Theme.of(context).iconTheme.color),
                          SizedBox(width: 10),
                          Text(
                            "Transfer",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.color),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              FadeInUp(
                duration: Duration(milliseconds: 1000),
                child: Text(
                  "Recent Transactions",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline5?.color,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Transactions
              Expanded(
                child: Container(
                  height: 200,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return FadeInUp(
                        from: 50,
                        duration: Duration(milliseconds: 1000 + index * 100),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.blueGrey.withOpacity(0.3),
                                  width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Iconsax.arrow_3,
                                  color: Theme.of(context).iconTheme.color),
                              SizedBox(width: 10),
                              Text(
                                "Transfer",
                                style: TextStyle(
                                  color: Theme.of(context).iconTheme.color,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "\$1,000,000",
                                style: TextStyle(
                                  color: Theme.of(context).iconTheme.color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "1:00 PM",
                                style: TextStyle(
                                  color: Theme.of(context).iconTheme.color,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
