


import 'package:test_pro/features/login/domain/entities/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {

  LoginResponseModel({required super.isSuccess});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      isSuccess: json['isSuccess'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isSuccess': super.isSuccess,
    };
  }
}