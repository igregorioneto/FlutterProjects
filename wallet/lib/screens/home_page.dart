import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoaded = false;

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
          onPressed: () {}, icon: Icon(Icons.menu color: Colors.blueGrey,),),
      ),
    );
  }
}
