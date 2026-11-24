import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String _userName = '';
  String get userName => _userName;

  bool get hasName => _userName.isNotEmpty;
  static const String _nameKey = 'user_name_key';

  UserProvider() {
    _loadName();
  }

  // Ambil nama yang tersimpan saat aplikasi dibuka
  void _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    _userName = prefs.getString(_nameKey) ?? '';
    notifyListeners();
  }

  // Simpan nama baru
  void saveName(String name) async {
    _userName = name.trim();
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_nameKey, _userName);
  }

  // Hapus nama yang tersimpan
  void clearName() async {
    _userName = '';
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_nameKey);
  }
}