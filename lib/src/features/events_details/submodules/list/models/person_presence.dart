class PersonPresence {
  final String name;
  final String email;
  final String phone;
  bool present;

  PersonPresence(
      {required this.email,
      required this.phone,
      required this.name,
      required this.present});
}
