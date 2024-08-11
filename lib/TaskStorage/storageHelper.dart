import 'package:shared_preferences/shared_preferences.dart';

//storing tasks in shared preferences
Future<void> storeStringList(String key, List<String> list) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(key, list);
}