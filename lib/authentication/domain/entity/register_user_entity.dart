class RegisterUserEntity {
  final String email;
  final String password;
  final String name;
  final String phone;
  final int avaterId;
  final String id;

  RegisterUserEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.avaterId});
}
