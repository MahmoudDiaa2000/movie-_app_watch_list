import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class MovieModel extends HiveObject {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String names;
  @HiveField(3)
  final int date;

  MovieModel(
      {required this.image,
      required this.title,
      required this.date,
      required this.names});
}
