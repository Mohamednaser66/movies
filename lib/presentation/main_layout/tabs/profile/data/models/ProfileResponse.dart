import 'profile.dart';

/// message : "Profile fetched successfully"
/// data : {"_id":"6900fd2de32c41b1e27914cb","email":"mohamed66@gmail.com","password":"$2b$10$UBBy.MT/VaOn8igHhIaF2.Ix3ZOMw6JF9tWgkmEv.s2EB7hk2nw1G","name":"amrmustafa","phone":"+201141209334","avaterId":1,"createdAt":"2025-10-28T17:28:13.256Z","updatedAt":"2025-10-28T17:28:13.256Z","__v":0}

class ProfileResponse {
  ProfileResponse({
      this.message, 
      this.data,});

  ProfileResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Profile.fromJson(json['data']) : null;
  }
  String? message;
  Profile? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}