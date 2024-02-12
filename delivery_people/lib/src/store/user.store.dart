import 'package:delivery_people/src/core/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'user.store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final UserRepository repository;

  _UserStore({required this.repository});

  @observable
  bool _isLogged = false;
  bool get isLogged => _isLogged;

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @action
  Future<void> login(String email, String password) async {
    _isLoading = true;

    _isLogged = await repository.login(email, password);

    _isLoading = false;
  }

  @action
  Future<void> logout() async {
    _isLoading = true;
    _isLogged = await repository.logout();
    _isLoading = false;
  }
}