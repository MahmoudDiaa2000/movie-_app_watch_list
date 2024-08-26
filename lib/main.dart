import 'package:flutter/material.dart';

import 'watch_list.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:WatchList.routeName,
      routes: {

        WatchList.routeName:(context)=>WatchList()
      },
    );
  }
}