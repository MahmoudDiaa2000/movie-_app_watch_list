import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../home/item_list.dart';
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
      initialRoute: WatchList.routeName,
      routes: {
        WatchList.routeName: (context) => WatchList(),
        ItemList.routeName: (context) => ItemList(
              model: MovieModel(
                  image: "assets/images/Mask Group 2.png",
                  title: "movie 1",
                  date: 2019,
                  names: "Diaa ,ZCO"),
            ),
      },
    );
  }
}