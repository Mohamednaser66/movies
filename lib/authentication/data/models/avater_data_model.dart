import 'package:movie/core/assets_manger.dart';

class AvaterDataModel {
 final String image;
 final int id;
 AvaterDataModel({required this.id,required this.image});
static List<AvaterDataModel> avaters =[
  AvaterDataModel(id: 0, image: ImagesManger.profile1),
  AvaterDataModel(id: 1, image:ImagesManger.profile2),
  AvaterDataModel(id: 2, image: ImagesManger.profile3),
  AvaterDataModel(id: 3, image: ImagesManger.profile4),
  AvaterDataModel(id: 4, image: ImagesManger.profile5),
  AvaterDataModel(id: 5, image: ImagesManger.profile6),
  AvaterDataModel(id: 6, image: ImagesManger.profile7),
  AvaterDataModel(id: 7, image: ImagesManger.profile8),
  AvaterDataModel(id: 8, image: ImagesManger.profile9)
 ];
}

