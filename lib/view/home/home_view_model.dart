import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel {
  final String _key = 'counter';
  // Random Value Generator
  // params: value int
  // return: int random number generator
  int randomValue({int? value}) => Random().nextInt(value ?? 100);

  Future<void> setValueOnPreferences(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, value);
  }

  Future<int?> getValueOnPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key);
  }
}
