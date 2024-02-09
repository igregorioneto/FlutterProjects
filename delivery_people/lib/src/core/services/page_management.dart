import 'package:delivery_people/src/pages/overview/overview_page.dart';
import 'package:delivery_people/src/pages/profile/profile_page.dart';
import 'package:delivery_people/src/pages/report/report_page.dart';
import 'package:flutter/material.dart';

sealed class PageManagement {
  static List<Widget> _widgetOptions = <Widget>[
    ReportPage(),
    OverviewPage(),
    ProfilePage(),
  ];

  static List<Widget> get widgetOptions => _widgetOptions;
}