import 'package:movie/presentation/main_layout/tabs/home/data/models/Data.dart';
import 'package:movie/presentation/main_layout/tabs/home/domain/entity/movie_data_entity.dart';

class MovieResponseEntity{
  String? statusMessage;
  MovieDataEntity? data;
  MovieResponseEntity({required this.data,required this.statusMessage});
}