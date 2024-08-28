import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'model.dart';

class AddMovie extends StatelessWidget {
  static const routeName = 'addMovie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/Mask Group 2.png",
                fit: BoxFit.cover,
              ),
              Container(
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    () async {
                      const String title = '';
                      const String names = '';
                      const int date = 0;

                      // Create a MovieModel instance
                      final movie = MovieModel(
                        image: "assets/images/placeholder.png"
                        // Replace with default image
                        // Consider allowing user to select an image from device
                        ,
                        title: title,
                        names: names,
                        date: date,
                      );

                      // Add movie to the Hive box
                      final box = await Hive.box<MovieModel>('Movie_box');
                      await box.add(movie);

                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Movie added successfully!')),
                      );
                    };
                    child:
                    Text('Add Movie');
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.transparent)),
                  child: Image.asset(
                    'assets/images/Group 24.png',
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "title",
                maxLines: 1,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Color(0xffFFFFFF)),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${2014}",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color(0xff707070)),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Sub Titel",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color(0xff707070)),
              )
            ],
          )
        ],
      ),
    );
  }
}

void saveMovieData(String title, String names, int date) async {
  final box = await Hive.openBox<MovieModel>('Movie_box');

  // Create a MovieModel instance
  final movie = MovieModel(
    image: "assets/images/placeholder.png", // Replace with default image
    title: title,
    names: names,
    date: date,
  );

  // Add movie to the Hive box
  await box.add(movie);

  // Optionally, provide feedback to the user
  print('Movie added successfully!');
}
