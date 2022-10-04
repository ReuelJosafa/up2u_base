import 'package:flutter/cupertino.dart';
import 'package:up2u_base/src/features/users/models/user_model.dart';

class AddUserController extends ChangeNotifier {
  bool _isExpanded = false;
  bool _canAccessCard = false;
  bool _canAccessMenu = false;
  bool _canAccessLists = false;
  bool _canEditUser = false;
  String _name = '';
  String _job = '';
  String _email = '';
  String _password = '';
  UniqueKey expansionTileKey = UniqueKey();

  List<UserModel> users = List.generate(
      3,
      (index) => UserModel(
          name: 'André Mineiro $index',
          job: 'Barman',
          email: 'andre@email.com',
          permissions: ['Cardápio', 'Listas']));

  get isExpanded => _isExpanded;
  get canAccessCard => _canAccessCard;
  get canAccessMenu => _canAccessMenu;
  get canAccessLists => _canAccessLists;
  get canEditUser => _canEditUser;

  void onChangeName(String value) => _name = value;
  void onChangeJob(String value) => _job = value;
  void onChangeEmail(String value) => _email = value;
  void onChangePassword(String value) => _password = value;

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  void toggleCardAccess() {
    _canAccessCard = !_canAccessCard;
    notifyListeners();
  }

  void toggleMenuAccess() {
    _canAccessMenu = !_canAccessMenu;
    notifyListeners();
  }

  void toggleListsAccess() {
    _canAccessLists = !_canAccessLists;
    notifyListeners();
  }

  void toggleEditUser() {
    _canEditUser = !_canEditUser;
    notifyListeners();
  }

  String? onValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, preencha este campo.';
    }
    return null;
  }

  void addUser() {
    final newUser = UserModel(
        name: _name, job: _job, email: _email, permissions: _getPermissions());

    users.add(newUser);
    _cleanAddFields();

    notifyListeners();
  }

  void _cleanAddFields() {
    _isExpanded = false;
    _canAccessCard = false;
    _canAccessMenu = false;
    _canAccessLists = false;
    _canEditUser = false;

    _name = '';
    _job = '';
    _email = '';

    _isExpanded = false;
    expansionTileKey = UniqueKey();
  }

  List<String> _getPermissions() {
    List<String> permissions = [];
    if (_canAccessCard) {
      permissions.add('Card');
    }

    if (canAccessMenu) {
      permissions.add('Cardápio');
    }

    if (canAccessLists) {
      permissions.add('Listas');
    }

    if (canEditUser) {
      permissions.add('Edição de usuários');
    }
    return permissions;
  }
}
