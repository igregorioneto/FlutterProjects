import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoaded = false;
  int _currentIndex = 0;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoaded = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.blueGrey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.blueGrey,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.blueGrey,
          ),
        ),
      ),
      backgroundColor: Color(0xff161621),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
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
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.explore_outlined),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.data_usage),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, bool boxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      child: Text(
                        "Balance",
                        style: TextStyle(
                          color: Colors.blueGrey.shade300,
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
                          color: Colors.blueGrey.shade300,
                          fontSize: 40,
                        ),
                      ),
                      duration: Duration(milliseconds: 800),
                    ),
                    FadeInUp(
                      child: Container(
                        width: double.infinity,
                        height: 250,
                        child: LineChart(
                          mainData(),
                          swapAnimationDuration: Duration(milliseconds: 1000),
                          swapAnimationCurve: Curves.linear,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ];
        },
        body: Container(),
      ),
    );
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
        show: true,
        horizontalInterval: 1.6,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            dashArray: const [3, 3],
            color: const Color(0xff37434d).withOpacity(0.2),
            strokeWidth: 2,
          );
        },
        drawVerticalLine: false,
      ),
      titlesData: FlTitlesData(
          show: true,
          rightTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
            getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 0:
                  return 'MAR';
                case 4:
                  return 'JUN';
                case 8:
                  return 'SEP';
                case 11:
                  return 'OCT';
              }
              return '';
            },
            margin: 10,
          ),
          leftTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff67727d),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return '10k';
                case 3:
                  return '30k';
                case 5:
                  return '50k';
              }
              return '';
            },
            reservedSize: 25,
            margin: 12,
          )),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: _isLoaded
              ? [
                  FlSpot(0, 3),
                  FlSpot(2.4, 2),
                  FlSpot(4, 3),
                  FlSpot(6.4, 3.1),
                  FlSpot(8, 4),
                  FlSpot(9.5, 4),
                  FlSpot(11, 5),
                ]
              : [
                  FlSpot(0, 0),
                  FlSpot(0, 0),
                  FlSpot(0, 0),
                  FlSpot(0, 0),
                  FlSpot(0, 0),
                  FlSpot(0, 0),
                  FlSpot(0, 0),
                ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradientFrom: Offset(0, 0),
            gradientTo: Offset(0, 1),
            colors: [
              Color(0xff02d39a).withOpacity(0.1),
              Color(0xff02d39a).withOpacity(0),
            ],
          ),
        ),
      ],
    );
  }
}
