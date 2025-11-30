/// email : "mostafaa@gmail.com"
/// avaterId : 2
/// name : "mohamed"
/// phone : "01067207444"

class EditeProfileRequest {
  EditeProfileRequest({
      this.email, 
      this.avaterId, 
      this.name, 
      this.phone,});

  EditeProfileRequest.fromJson(dynamic json) {
    email = json['email'];
    avaterId = json['avaterId'];
    name = json['name'];
    phone = json['phone'];
  }
  String? email;
  int? avaterId;
  String? name;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['avaterId'] = avaterId;
    map['name'] = name;
    map['phone'] = phone;
    return map;
  }

}