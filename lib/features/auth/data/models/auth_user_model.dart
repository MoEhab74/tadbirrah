import 'package:supabase_flutter/supabase_flutter.dart';

class AuthUserModel {
  final String id;
  final String email;
  final String familyName;

  const AuthUserModel({
    required this.id,
    required this.email,
    required this.familyName,
  });

  factory AuthUserModel.fromSupabaseUser(User user) {
    return AuthUserModel(
      id: user.id,
      email: user.email ?? '',
      familyName: (user.userMetadata?['family_name'] as String?) ?? 'بيتنا',
    );
  }

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      familyName: json['family_name'] as String? ?? 'بيتنا',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'family_name': familyName,
    };
  }
}
