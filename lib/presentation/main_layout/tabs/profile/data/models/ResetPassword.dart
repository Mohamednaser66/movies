/// oldPassword : "Amr2510@"
/// newPassword : "Test2510@"

class ResetPasswordRequest {
  ResetPasswordRequest({
      this.oldPassword, 
      this.newPassword,});

  ResetPasswordRequest.fromJson(dynamic json) {
    oldPassword = json['oldPassword'];
    newPassword = json['newPassword'];
  }
  String? oldPassword;
  String? newPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['oldPassword'] = oldPassword;
    map['newPassword'] = newPassword;
    return map;
  }

}