class UserLoginResponse {
  String? message;
  String? token;

  UserLoginResponse({
    this.message,
    this.token
  } );

  UserLoginResponse.fromJson(dynamic json) {
    final msg = json['message'];
    message = msg is List ? msg.join(', ') : msg?.toString();
    token = json['data'];
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': token,
    };
  }
}
