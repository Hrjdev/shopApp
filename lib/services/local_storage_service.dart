import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveData(String userName) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("ls_userName", userName);
    print("Name Saved : ${userName}");
  }

  Future<String> getData() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("ls_userName") ?? "";
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove("ls_userName");
  }
}
