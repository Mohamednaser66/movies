import 'package:movie/presentation/main_layout/tabs/profile/domain/entity/profile_entity.dart';

/// _id : "6900fd2de32c41b1e27914cb"
/// email : "mohamed66@gmail.com"
/// password : "$2b$10$UBBy.MT/VaOn8igHhIaF2.Ix3ZOMw6JF9tWgkmEv.s2EB7hk2nw1G"
/// name : "amrmustafa"
/// phone : "+201141209334"
/// avaterId : 1
/// createdAt : "2025-10-28T17:28:13.256Z"
/// updatedAt : "2025-10-28T17:28:13.256Z"
/// __v : 0

class Profile {
  Profile({
      this.id, 
      this.email, 
      this.password, 
      this.name, 
      this.phone, 
      this.avaterId, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Profile.fromJson(dynamic json) {
    id = json['_id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
  ProfileEntity toProfileEntity(){
    return ProfileEntity(id: id, avaterId: avaterId, phone: phone, password: password, email: email, name: name);
}
}