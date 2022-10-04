class UserModel {
  final String name;
  final String job;
  final String email;
  final List<String> permissions;

  UserModel(
      {required this.name,
      required this.job,
      required this.email,
      required this.permissions});

  String get permissionsAsString {
    return permissions.toString().replaceAll('[', '').replaceAll(']', '');
  }
}
