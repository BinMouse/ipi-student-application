import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Класс для хранения токена
///
/// Обращается к специальному классу для хранения чуствительных (sensetive) данных

class TokenStorage {
  static const _storage = FlutterSecureStorage();

  /// Сохранение токена
  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  /// Получение токена
  static Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  /// Удаление токена
  static Future<void> deleteToken() async {
    await _storage.delete(key: 'auth_token');
  }
}
