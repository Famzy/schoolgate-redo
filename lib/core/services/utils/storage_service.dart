import 'dart:convert';
import 'package:schoolgate/core/models/shared_models/auth_response.dart';
import 'package:schoolgate/core/models/student_models/categories.dart';
import 'package:schoolgate/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences _sharedPreferences;

  StorageService({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  saveUserLocally({required User currentUser}) async =>
      _sharedPreferences.setString("user", jsonEncode(currentUser.toJson()));

  saveAuthResponseLocally({required AuthResponse userAuthResponse}) async =>
      _sharedPreferences.setString("auth", jsonEncode(userAuthResponse.toJson()));

  Future<bool> cacheSelectedInterest({List<Categories>? interests}) async {
    // print("Hit and saved: ${interests!.first.toJson()}");
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(
      AppStrings.CACHE_INTEREST,
      json.encode(interests),
    );
  }


  String? getToken() => _sharedPreferences.getString("token");
}
