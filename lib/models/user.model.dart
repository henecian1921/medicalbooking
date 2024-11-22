class User {
  final int? id;
  final String? email;
  final String? password;
  final String? fullName;
  final String? address;
  final String? phone;
  final String? dateOfBirth;
  final String? genderName;
  final String? avatar;
  final bool? isLocked;
  final String? createdDate;
  final String? lastModifiedDate;
  User(
      {
        required this.id,
        required this.email,
        this.password,
        required this.fullName,
        required this.address,
        required this.phone,
        required this.dateOfBirth,
        this.genderName,
        required this.avatar,
        this.isLocked,
        this.createdDate,
        this.lastModifiedDate});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['userId'],
      fullName: json['fullName'],
      phone: json['phone'],
      dateOfBirth: json['dateOfBirth'],
      address: json['address'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}
