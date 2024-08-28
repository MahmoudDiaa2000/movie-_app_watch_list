import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app_watchlist/add_movie%20_watch_list.dart';

import '../home/watch_list.dart';
import '../model.dart';

late Box<MovieModel> movieBox;

void main() async {
  await Hive.initFlutter();
  movieBox = await Hive.openBox('Movie_box');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AddMovie.routeName,
      routes: {
        WatchList.routeName: (context) => WatchList(),
        AddMovie.routeName: (context) => AddMovie()
      },
    );
  }
}