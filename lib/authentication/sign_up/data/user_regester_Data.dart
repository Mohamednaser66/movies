
class UserRegisteredData {
  final String email;
  final String password;
  final String name;
  final String phone;
  final int avaterId;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int v;

  UserRegisteredData({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.avaterId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  UserRegisteredData.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          email: json['email'],
          password: json['password'],
          phone: json['phone'],
          avaterId: json['avaterId'],
          id: json['_id'],
          createdAt: json['createdAt'],
          updatedAt: json['updatedAt'],
          v: json['__v'],
        );
}
