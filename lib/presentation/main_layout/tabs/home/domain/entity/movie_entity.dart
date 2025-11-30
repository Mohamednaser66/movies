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
  String? backgroundImage;
  String? largeCoverImage;
  String? state;
  List<Torrents>? torrents;
  String? dateUploaded;


  MovieEntity(
      {required this.state,
      required this.id,
      required this.title,
      required this.year,
      required this.url,
      required this.backgroundImage,
      required this.dateUploaded,
      required this.descriptionFull,
      required this.genres,
      required this.largeCoverImage,
      required this.rating,
      required this.summary,
      required this.torrents,
      required this.runtime});
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['title'] = title;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['summary'] = summary;
    map['description_full'] = descriptionFull;
    map['background_image'] = backgroundImage;
    map['large_cover_image'] = largeCoverImage;
    map['date_uploaded']=dateUploaded;
    map['state'] = state;
    if (torrents != null) {
      map['torrents'] = torrents?.map((v) => v.toJson()).toList();
    }
    return map;
  }
  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
     state: json['state'],
      summary: json['summary'],
      torrents: json['torrents'],
      id: json['id'],
      dateUploaded: json["date_uploaded"],
      runtime: json['runtime'],
      backgroundImage: json['background_image'],
      title: json['title'] as String,
      largeCoverImage: json['largeCoverImage'] as String,
      rating: json['rating'] as double,
      year: json['year'],
      url: json['url'],
      descriptionFull: json['description_full'],
      genres: json['genres'],



    );
  }}