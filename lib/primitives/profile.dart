/// Инстанс информации профиля
class Profile {
  static Profile? _instance;
  static Profile get instance => _instance ??= Profile(username: '', lastName: '', firstName: '', middleName: '', major: '', groupCode: '', emailAdress: '', phoneNumber: '', photoUrl: '');

  String username;
  String lastName;
  String firstName;
  String middleName;
  String major;
  String groupCode;
  String emailAdress;
  String phoneNumber;
  String photoUrl;

  Profile({
    required this.username,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.major,
    required this.groupCode,
    required this.emailAdress,
    required this.phoneNumber,
    required this.photoUrl,
  });

  /// Парсит данные JSON в профиль
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      username: json['username'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      major: json['major'] as String,
      groupCode: json['groupCode'] as String,
      emailAdress: json['emailAdress'] as String,
      phoneNumber: json['phoneNumber'] as String,
      photoUrl: json['photoUrl'] as String,
    );
  }

  // Метод для преобразования Profile в JSON (на всякий)
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'lastName': lastName,
      'firstName': firstName,
      'middleName': middleName,
      'major': major,
      'groupCode': groupCode,
      'emailAdress': emailAdress,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
    };
  }
}