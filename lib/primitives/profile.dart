class Profile {
  static Profile? _instance;
  static Profile get instance => _instance ??= Profile();

  String? photoUrl;
  String? fullName;
  String? groupName;
  String? groupNumber;
  String? phoneNumber;

  Profile({
    this.photoUrl,
    this.fullName,
    this.groupName,
    this.groupNumber,
    this.phoneNumber,
  });
}