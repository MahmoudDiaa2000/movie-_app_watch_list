import 'package:flutter/material.dart';
import 'package:movies_app_watchlist/model.dart';

class ItemList extends StatelessWidget {
  static const routeName = 'List';

  final MovieModel model;

  ItemList({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Stack(
              children: [
                Image.asset(
                  model.image,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.transparent)),
                    child: Image.asset(
                      'assets/images/bookmark.png',
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model.title,
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
                  "${model.date}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0xff707070)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  model.names,
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
      ),
    );
  }
}
