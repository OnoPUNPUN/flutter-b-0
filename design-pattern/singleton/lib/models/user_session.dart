class UserSession {
  UserSession._internal() {
    print("Constructor Created");
  }

  static final UserSession _instance = UserSession._internal();
  static UserSession get instance => _instance;

  String? _userId;
  bool _isLoggedIn = false;

  String? get userId => _userId;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String userId) async {
    _userId = userId;
    _isLoggedIn = true;

    await _saveToSecureStorage();
  }

  Future<void> logout() async {
    _userId = null;
    _isLoggedIn = false;
  }

  Future<void> _saveToSecureStorage() async {
    print("simulating _saveToSecureStorage");
  }
}
