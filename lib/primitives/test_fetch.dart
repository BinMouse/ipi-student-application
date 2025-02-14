import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ipi_app/primitives/token_storage.dart';
import 'package:ipi_app/primitives/profile.dart';

/// ToDo: переделать на нормальный класс
class TestFetch{
  static TestFetch? _instance;
  static TestFetch get instance => _instance ??= TestFetch();
  static String _serverIP = "192.168.0.104:5000";

  void updateIP(String newIP){
    _serverIP = newIP;
  }
  // Login request
  Future<http.Response> _getLogin(String username, String password){
    return http.post(
      Uri.parse('http://'+_serverIP+'/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
  }

  Future<http.Response> _getUserInfo() async{
    String? token = await TokenStorage.getToken();
    print("Token: $token");
    return http.get(
        Uri.parse('http://'+_serverIP+'/user_info'),
        headers: {
          "Authorization" : "Bearer $token",
        }
    );
  }

  /// Отправляет запрос на вход
  Future<int> Login(String username, String password) async {
    try {
      http.Response response = await _getLogin(username, password);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        TokenStorage.saveToken(data["token"]);
        return 200;
      } else if (response.statusCode == 401) {
        print("Неверный логин или пароль");
        return 401;
      } else {
        print("Ошибка: ${response.statusCode}");
        return response.statusCode;
      }
    } catch (e) {
      // Обработка исключений (например, проблемы с сетью)
      print("Ошибка: $e");
      return -1;
    }
  }

  Future<int> UpdateProfileInfo() async {
    http.Response response = await _getUserInfo();

    if (response.statusCode == 200) {
      //Profile.instance = Profile.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      // Обновляем данные в Profile.instance, не пересоздавая экземпляр
      Map<String, dynamic> data = jsonDecode(response.body);
      Profile.instance.username = data['username'] ?? 'Нет данных';
      Profile.instance.lastName = data['last_name'] ?? 'Нет данных';
      Profile.instance.firstName = data['first_name'] ?? 'Нет данных';
      Profile.instance.middleName = data['middle_name'] ?? 'Нет данных';
      Profile.instance.major = data['major'] ?? 'Нет данных';
      Profile.instance.groupCode = data['group_code'] ?? 'Нет данных';
      Profile.instance.emailAdress = data['email'] ?? 'Нет данных';
      Profile.instance.phoneNumber = data['phone'] ?? 'Нет данных';
      Profile.instance.photoUrl = data['image_url'] ?? '';
    }
    return response.statusCode;
  }
}