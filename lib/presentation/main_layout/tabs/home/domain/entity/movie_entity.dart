import 'package:movie/presentation/main_layout/tabs/home/data/models/Torrents.dart';

class MovieEntity {
  int? id;
  String? url;
  String? title;
  int? year;
  num? runtime;
  num? rating;
  List<String>? genres;
  String? summary;
  String? descriptionFull;
  String? language;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? state;
  List<Torrents>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  MovieEntity(
      {required this.state,
      required this.id,
      required this.title,
      required this.year,
      required this.url,
      required this.language,
      required this.backgroundImage,
      required this.backgroundImageOriginal,
      required this.dateUploaded,
      required this.dateUploadedUnix,
      required this.descriptionFull,
      required this.genres,
      required this.largeCoverImage,
      required this.mediumCoverImage,
      required this.rating,
      required this.smallCoverImage,
      required this.summary,
      required this.torrents,
      required this.runtime});
}
