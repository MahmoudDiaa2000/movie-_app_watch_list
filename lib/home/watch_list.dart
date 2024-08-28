import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app_watchlist/api/api_manger.dart';
import 'package:movies_app_watchlist/home/item_list.dart';
import 'package:movies_app_watchlist/model/sourceResponse.dart';
import '../model.dart';
import '../model/app_colors.dart';
import '../model/main.dart';

class WatchList extends StatefulWidget {
  static const routeName = 'watchList';

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  /*List <MovieModel> list=[
    MovieModel(image: "assets/images/Mask Group 2.png", title: "movie 1", date: 2019, names: "Diaa ,ZCO"),
    MovieModel(image: "assets/images/Mask Group 2.png", title: "movie 2", date: 2020, names: "Diaa ,ZCO"),
    MovieModel(image: "assets/images/Mask Group 2.png", title: "movie 3", date: 2022, names: "Diaa ,ZCO"),
    MovieModel(image: "assets/images/Mask Group 2.png", title: "movie 4", date: 2024, names: "Diaa ,ZCO"),
  ];
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Watch List',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w900, color: Colors.amber),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: movieBox.listenable(),
        builder: (context, Box<MovieModel> box, _) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final movie = box.get(index);
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black),
                          clipBehavior: Clip.antiAlias,
                          child: Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                      movie!.image,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      height: 35,
                                      child: Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            /// write here path of home screen
                                            /// to return when delete movie from list
                                            /* Navigator.push(context,
                                                MaterialPageRoute(builder: (_) => );*/
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.transparent)),
                                          child: Image.asset(
                                            'assets/images/bookmark.png',
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          movie.title,
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
                                          movie.date.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Color(0xff707070)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          movie.names,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Color(0xff707070)),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                            color: AppColors.gry,
                          ),
                      itemCount: box.length),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// impo
/*
Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: isLoading?const Center(child: CircularProgressIndicator()):ListView.separated(
                  itemBuilder: (context,index) => ItemList(model: list[index],)
                  , separatorBuilder:  (context,index) =>Divider(
                    color: AppColors.gry,

                  )
                  , itemCount: list.length),
            ),
          ),
        ],
      ) ,
 */

/*
  bool isLoading = false;
void getDate ()async{
  isLoading =true;
  setState(() {

  });
 await Future.delayed(Duration(seconds: 2));
   isLoading = false;
  setState(() {

  });
}


@override
  void initState(){
super.initState();
getDate();

  }
 */
