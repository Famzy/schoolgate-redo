abstract class AuthenticationService {
  Future login({
    required String username,
    required String password,
  });
  Future saveUserLocally();
}
