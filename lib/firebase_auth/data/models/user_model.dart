import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String userId;
  final String name;
  final String email;

  const UserModel({
    required this.userId,
    required this.name,
    required this.email,
  });

  @override
  List<Object> get props => [userId, name, email];

  UserModel copyWith({
    String? userId,
    String? name,
    String? email,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  static const empty = UserModel(userId: '', email: '', name: '');
}
